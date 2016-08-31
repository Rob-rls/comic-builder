class ComicsController < ApplicationController
    before_action, authenticate_user!, :except => [:index, :show]

    def index
        @comics = Comic.all
        @strips = Strip.all
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
      @strip = Strip.find_by(:comic_id => params[:id])
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

    def destroy
      @comic = Comic.find(params[:id])
      @comic.destroy
      redirect_to comics_path
      flash[:notice] = 'Comic has been deleted'
    end

    private

    def comic_params
        params.require(:comic).permit(:title)
    end
end
