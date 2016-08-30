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
      redirect_to "/strips/#{@strip.id}"
    else
      render "new"
    end
  end

  def show
    @strip = Strip.find(params[:id])

  end

  private

  def strip_params
    params.require(:strip).permit(:name)
  end

end
