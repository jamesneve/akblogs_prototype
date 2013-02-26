class PostsController < ApplicationController
  respond_to :html, :xml, :atom

  def index
  	@posts = Post.paginate(per_page: 10, page: params[:page]).order('published_on DESC')
  	respond_with @posts
  end

  def updatefeeds
  	updateSuccessful = true

  	Site.all.each do |site|
  		feed = Feedzirra::Feed.fetch_and_parse(site.rss)
  		if feed && feed != 404
	  		feed.entries.each do |entry|
	  			unless Post.exists?(published_on: entry.published)

	  				content = entry.content
	  				content = entry.summary if content.blank?

            image_url = nil
            images = Nokogiri::HTML(content).css('img').map{ |i| i['src'] }
            images.each do |image|
              dim = FastImage.size(image)
              if dim[0] >= 150 && dim[1] >= 150
                image_url = image
                break
              end
            end

            if image_url
  	  				newPost = site.posts.build(title: entry.title,
  	  						remote_image_url: image_url,
  	  						content: content,
                  entry_url: entry.url,
                  author: entry.author,
  	  						published_on: entry.published)
            else
              newPost = site.posts.build(title: entry.title,
                  content: content,
                  entry_url: entry.url,
                  author: entry.author,
                  published_on: entry.published)
            end
	  				updateSuccessful = false unless newPost.save
	  			end
	  		end
	  	end
  	end

  	if updateSuccessful
  		flash[:success] = "All feeds updated successfully!"
  	else
  		flash[:error] = "There was a problem updating some feeds"
  	end

  	redirect_to posts_path

  end
end
