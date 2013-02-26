class SitesController < ApplicationController
  respond_to :xml, :html

  def new
  	respond_with(@site = Site.new)
  end

  def index
    @sites = Site.paginate(per_page: 10, page: params[:page])
  	respond_with @site
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

  def bookmarklet
    respond_to do |format|
      format.js { render 'bookmarklet' }
    end
  end

  def destroy
    Site.find(params[:id]).destroy
    flash[:success] = "Site deleted"
    redirect_to sites_url
  end

  def edit
    respond_with(@site = Site.find(params[:id]))
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      flash[:success] = "Site updated!"
      redirect_to sites_path
    else
      render 'edit'
    end
  end

end
