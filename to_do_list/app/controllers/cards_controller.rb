class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = "Card successfully created"
      redirect_to cards_path
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

  private

  def card_params
    params.require(:card).permit(:title, :description)
  end
end
