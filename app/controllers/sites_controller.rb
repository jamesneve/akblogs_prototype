class SitesController < ApplicationController
  respond_to :xml, :html

  def new
  	respond_with(@site = Site.new)
  end

  def index
  	respond_with(@sites = Site.all)
  end

  def create
  	@site = Site.new(params[:site])
  	if @site.save
  		flash[:success] = "Site added to directory successfully!"
  		redirect_to sites_path
  	else
  		render 'new'
  	end
  end
end
