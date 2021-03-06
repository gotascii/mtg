class CardsController < ApplicationController
  before_filter :load_color
  before_filter :load_card, :only => [:destroy, :edit, :update]
  before_filter :load_types, :only => [:index, :edit]

  def index
    @card = Card.new
    @card.color_ids = [@color.try(:id)]
    load_cards
  end

  def create
    @card = Card.new(params[:card])
    if @card.save
      flash.now[:notify] = "#{@card.titleized_name} was successfully created."
    else
      flash.now[:error] = "#{@card.titleized_name} was not saved!"
    end
    load_cards
  end

  def destroy
    @card.delete
    redirect_to cards_url(:color_id => @color.try(:id), :search => params[:search])
  end

  def edit
    load_search
  end

  def update
    @card.update_attributes(params[:card])
    load_cards
  end

  private
  def load_types
    @colors = Color.all
    @expansions = Expansion.all
    @card_types = CardType.all
  end

  def load_card
    @card = Card.find(params[:id])
  end

  def load_color
    @color = Color.find_by_id(params[:color_id])
  end

  def load_search
    @cards = @color.nil? ? Card : @color.cards
    @cards = @cards.include_associations
    @search = @cards.search(params[:search])
  end

  def load_cards
    load_search
    page = params[:page].blank? ? nil : params[:page]
    @cards = @search.paginate(:page => page)
  end
end