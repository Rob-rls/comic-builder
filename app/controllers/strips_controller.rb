class StripsController < ApplicationController

  def index
    @strips = Strip.all
  end

  def new
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.new
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.new(strip_params) #@comic.strip.new(strip_params)
    @strip.comic_id = params[:comic_id]
    if @strip.save
      flash[:notice] = "New comic strip successfully created"
      redirect_to "/comics/#{@comic.id}"
    else
      render "new"
    end
  end

  def show
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:comic_id])
    @strip = Strip.find(params[:id])
    @strip.update(strip_params)
    flash[:notice] = "Comic strip was successfully updated"
    redirect_to "/comics/#{@comic.id}/strips/#{@strip.id}"
  end

  private

  def strip_params
    params.require(:strip).permit(:name, :image, :image2, :image3, :caption1, :caption2, :caption3)
  end

end
