# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  rss        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  attr_accessible :name, :rss, :url

  validates :name, presence: true, length: { maximum: 100 }
  validates :rss, presence: true, uniqueness: true
  validates :url, presence: true

  has_many :posts, dependent: :destroy

  def getFeedEntries

	updateSuccessful = true
	feed = Feedzirra::Feed.fetch_and_parse(self.rss)
		if feed && feed != 404
		feed.entries.each do |entry|
		  unless Post.exists?(published_on: entry.published)

		    content = entry.content
		    content = entry.summary if content.blank?

		    image_url = nil
		    images = Nokogiri::HTML(content).css('img').map{ |i| i['src'] }
		    images.each do |image|
		      dim = FastImage.size(image)
		      if dim && dim[0] >= 100 && dim[1] >= 100
		        image_url = image
		        break
		      end
		    end

		    if image_url
		      newPost = self.posts.build(title: entry.title,
		          remote_image_url: image_url,
		          content: content,
		          entry_url: entry.url,
		          author: entry.author,
		          published_on: entry.published)
		    else
		      newPost = self.posts.build(title: entry.title,
		          content: content,
		          entry_url: entry.url,
		          author: entry.author,
		          published_on: entry.published)
		    end
		    
		    updateSuccessful = false unless newPost.save
		  end
		end
	end

	updateSuccessful
  end

end