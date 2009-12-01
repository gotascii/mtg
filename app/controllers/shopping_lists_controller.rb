class ShoppingListsController < ApplicationController
  def show
    @deck = Deck.find(params[:deck_id])
  end
end