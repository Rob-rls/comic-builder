class CommentsController < ApplicationController

  # def show
  #   @comments = Comment.all
  # end

  def new
    @comic = Comic.find(params[:comic_id])
    @comment = Comment.new
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @comment = @comic.comments.new(comment_params)
    @comment.save
    redirect_to comic_path(@comic.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
