class PostsController < ApplicationController
  respond_to :html, :xml

  def index
  	respond_with(@posts = Post.all)
  end
end
