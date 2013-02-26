class PostsController < ApplicationController
  respond_to :html, :xml

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

            nokContent = Nokogiri::HTML(content)
            image_url = (nokContent.css('img').map{ |i| i['src'] })[0]

	  				newPost = site.posts.build(title: entry.title,
	  						remote_image_url: image_url,
	  						content: content,
                entry_url: entry.url,
	  						published_on: entry.published)
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
