class ComicsController < ApplicationController

    def index
        @comics = Comic.all
    end

    def new
        @comic = Comic.new
    end

    def create
        @comic = Comic.new(comic_params)
        @comic.save
        redirect_to "/comics/#{@comic.id}/strips/new"
    end

    def show
      @comic = Comic.find(params[:id])
      @comments = @comic.comments.all
    end

    def edit
      @comic = Comic.find(params[:id])
    end

    def update
      @comic = Comic.find(params[:id])
      @comic.update(comic_params)
      flash[:notice] = 'Comic has been updated'
      redirect_to comic_path(@comic.id)
    end

    private

    def comic_params
        params.require(:comic).permit(:title)
    end
end
