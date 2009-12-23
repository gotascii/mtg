class DecksController < ApplicationController
  before_filter :load_deck, :only => [:show, :destroy, :edit, :update]

  def index
    load_decks
    @deck = Deck.new
  end

  def show
    load_colors_with_cards
    @search = @deck.picks.with_need.search(params[:search])
    @picks = @search.all
    @pick = Pick.new(:deck => @deck)
  end

  def create
    @deck = Deck.new(params[:deck])
    if @deck.save
      flash[:notify] = save_msg
      redirect_to decks_url
    else
      load_flash_error
      load_decks
      render "index"
    end
  end

  def destroy
    @deck.delete
    redirect_to decks_url
  end

  def edit
  end

  def update
    if @deck.update_attributes(params[:deck])
      flash.now[:notify] = save_msg
    else
      load_flash_error
    end
    load_decks
  end

  private
  def save_msg
    "#{@deck.name.upcase} was successfully saved."
  end
  
  def load_flash_error
    flash.now[:error] = ["#{@deck.name.upcase} could not be saved!"]
    flash.now[:error] += @deck.errors.on_base.collect do |msg|
      "#{msg} in the <a href=\"/cards\">card list</a>."
    end
  end

  def load_deck
    @deck = Deck.find(params[:id])
  end

  def load_decks
    @decks = Deck.all
  end
end