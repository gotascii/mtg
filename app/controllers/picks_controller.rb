class PicksController < ApplicationController
  before_filter :load_pick, :only => [:destroy, :edit, :update]

  def create
    @pick = Pick.create!(params[:pick])
    redirect_to_deck_url
  end

  def destroy
    @pick.delete
    redirect_to_deck_url
  end

  def edit
    load_colors_with_cards
    @colors << CardType::LAND
    load_picks
  end

  def update
    @pick.update_attributes(params[:pick])
    load_picks
  end

  private
  def load_picks
    @deck = @pick.deck
    @search = @deck.picks.with_need.search(params[:search])
    @picks = @search.all
  end

  def load_pick
    @pick = Pick.find(params[:id])
  end

  def redirect_to_deck_url
    redirect_to deck_url(@pick.deck, :search => params[:search])
  end
end