class ColorsController < ApplicationController
  # before_filter :load_new_item, :only => [:show]
  before_filter :load_colors_with_cards, :only => [:index]

  def index
  end
end