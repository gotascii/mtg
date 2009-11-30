class DecksController < ApplicationController
  before_filter :load_colors_with_cards, :only => [:show]

  def index
    @deck = Deck.new
    @decks = Deck.order_by_name
  end

  def show
    @deck = Deck.find(params[:id])
    @picks = @deck.picks
    @pick = Pick.new(:deck => @deck)
  end

  def create
    @deck = Deck.create!(params[:deck])
    redirect_to decks_url
  end
end