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
        redirect_to '/comics'
    end

    def show
      @comic = Comic.find(params[:id])
    end

    private

    def comic_params
        params.require(:comic).permit(:title)
    end
end
