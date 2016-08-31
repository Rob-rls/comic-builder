class CommentsController < ApplicationController

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

  def edit
    @comic = Comic.find(params[:comic_id])
    @comment = @comic.comments.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:comic_id])
    @comment = @comic.comments.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "Your comment was updated"
    redirect_to comic_path(@comic.id)
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    @comment = @comic.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been deleted"
    redirect_to comic_path(@comic.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
