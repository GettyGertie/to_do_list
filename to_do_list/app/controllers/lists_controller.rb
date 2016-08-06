class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List successfully created"
      redirect_to lists_path
    else
      render 'new'
      flash.now[:fail] = "Sorry Try again"
  end
  end

  def show
  @list = List.find_by(id: params[:id])
  @cards = @list.cards
  end

  def index
    @lists = current_user.lists
  end


  private

  def list_params
  params.require(:list).permit(:title)
  end

end
