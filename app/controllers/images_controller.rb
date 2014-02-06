class ImagesController < ApplicationController

  def index
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def show
	@image = Image.find(params[:id])
  end

  def create
  	@image = Image.new(image_params)
  	if @image.save
  		redirect_to :action => :show, :id => @image.id
  	end
  end

  private

  def image_params
  	params.require(:avatar).permit( :avatar, :name )
  end

end
