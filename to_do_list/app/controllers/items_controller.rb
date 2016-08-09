class ItemsController < ApplicationController
  def new
    @card = Card.find_by(id: params[:card_id])
    @item = Item.new
  end

  def create
    @card = Card.find_by(id: params[:card_id])
    params[:item][:condition] == '1' ? params[:item][:condition] = "Private" : params[:item][:condition] = "Public"
    @item = @card.items.build(item_params)
    if @item.save
      flash[:sucess]= "item added!"
      if @card.list.user != current_user
        redirect_to requests_accepted_list_path
      else
        redirect_to list_path(id: @card.list_id)
      end
    else
      flash[:fail] = "try again"
      render 'new'
    end
  end

  def index
    @items=[]
    public_items = Item.where(condition: "Public")
    public_items.each do |item|
      if item.card.list.user != current_user
        @items << item
      end
    end
  end

  def mark_as_done
item =Item.find_by(id: params[:item_id])
item.update_attribute(status: "done")
flash[:sucess] = "marked as done"
redirect_back fallback_location: root_url
  end

  def undo
    item = Item.find_by(id: params[:item_id])
    item.update_attribute(status: "incomplete")
    flash[:success]= "item undone"
    redirect_back fallback_location: root_url
  end

  private

  def item_params
    params.require(:item).permit(:activity, :condition)
  end
end
