# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def load_colors_with_cards
    @colors = Color.with_cards
  end
  
  def load_deck
    @deck = Deck.find(params[:deck_id])
  end
end