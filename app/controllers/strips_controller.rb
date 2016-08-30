class StripsController < ApplicationController

  def index
    @strips = Strip.all
  end

  def new
    @strip = Strip.new
  end

  def create
    @strip = Strip.new(strip_params)
    if @strip.save
      flash[:notice] = "New comic strip successfully created"
      redirect_to strips_path
    else
      render "new"
    end
  end

  private

  def strip_params
    params.require(:strip).permit(:name)
  end

end
