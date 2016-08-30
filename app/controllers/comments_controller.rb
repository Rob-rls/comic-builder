class CommentsController < ApplicationController

  # def show
  #   @comments = Comment.all
  # end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    # redirect_to comic_path()
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
