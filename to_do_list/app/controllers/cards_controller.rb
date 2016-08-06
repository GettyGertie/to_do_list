class CardsController < ApplicationController
  def new
    @list= List.find_by(id: params[:list_id])
    @card = Card.new
  end

  def create
    @card = list.cards.build(card_params)
    if @card.save
      flash[:success] = "Card successfully created"
      redirect_to list_path(id: list.id)
    else
      render 'new'
      flash.now[:fail] = "Sorry, try again"
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  
  def index
    @cards = Card.all
  end

  def move_card
    @card = Card.find_by(id: params[:card_id])
    @lists = current_user.lists
  end

  def choose_list
    card = Card.find(params[:id])
    card.update_attribute(:list_is, params[:list_id])
    flash[:success] = "card moved!"
    redirect_to list_path(id:params[:list_id])
  end

  private

  def card_params
    params.require(:card).permit(:title, :description)
  end
end
