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
  end

  def update
    @pick.update_attributes(params[:pick])
    @picks = @pick.deck.picks
  end

  private
  def load_pick
    @pick = Pick.find(params[:id])
  end

  def redirect_to_deck_url
    redirect_to deck_url(@pick.deck)
  end
end