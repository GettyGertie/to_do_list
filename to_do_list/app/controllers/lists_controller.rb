class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List successfully created"
      redirect_to @list
    else
      render 'new'
      flash.now[:fail] = "Sorry Try again"
  end
  end

  def show
  @list = List.find(params[:id])
  @cards = @list.cards
  end

  def index
    @lists = List.all
  end


  private

  def list_params
  params.require(:list).permit(:title)
  end

end
