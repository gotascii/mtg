class PicksController < ApplicationController
  def create
    @pick = Pick.create!(params[:pick])
    redirect_to_deck_url
  end

  def destroy
    @pick = Pick.find(params[:id])
    @pick.delete
    redirect_to_deck_url
  end

  private
  def redirect_to_deck_url
    redirect_to deck_url(@pick.deck)
  end
end