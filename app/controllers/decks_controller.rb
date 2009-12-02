class DecksController < ApplicationController
  before_filter :load_colors_with_cards, :only => [:show]
  before_filter :load_deck, :only => [:show, :destroy, :edit, :update]
  before_filter :load_decks, :only => [:index, :update]

  def index
    @deck = Deck.new
  end

  def show
    @picks = @deck.picks
    @pick = Pick.new(:deck => @deck)
  end

  def create
    @deck = Deck.create!(params[:deck])
    redirect_to decks_url
  end

  def destroy
    @deck.delete
    redirect_to decks_url
  end

  def edit
  end

  def update
    @deck.update_attributes(params[:deck])
  end

  private
  def load_deck
    @deck = Deck.find(params[:id])
  end

  def load_decks
    @decks = Deck.all
  end
end