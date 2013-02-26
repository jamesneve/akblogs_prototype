class PostsController < ApplicationController
  respond_to :html, :xml, :atom

  def index
  	@posts = Post.paginate(per_page: 10, page: params[:page]).order('published_on DESC')
  	respond_with @posts
  end

  def updatefeeds
  	updateSuccessful = true

  	Site.all.each do |site|
      updateSuccessful = false unless site.getFeedEntries
  	end

    if updateSuccessful
      respond_to do |format| 
        format.js
        format.html do 
          flash[:success] = "All feeds updated successfully!"
          redirect_to posts_url
        end
      end
    else
      flash[:error] = "There was a problem updating some feeds"
      redirect_to posts_url
    end

  end
end
