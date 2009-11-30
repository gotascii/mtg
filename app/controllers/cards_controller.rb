class CardsController < ApplicationController
  before_filter :load_color

  def index
    @card = Card.new(:color_id => @color.try(:id))
    @colors = Color.order_by_name
    @expansions = Expansion.order_by_name
    load_cards
  end

  def create
    @card = Card.create(params[:card])
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.js { load_cards }
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.delete
    redirect_to cards_url(:color_id => @color.try(:id))
  end

  private
  def load_color
    @color = Color.find(params[:color_id]) unless params[:color_id].blank?
  end
  
  def load_cards
    @cards = @color.nil? ? Card : @color.cards
    @cards = @cards.order_by_color_name
  end
end