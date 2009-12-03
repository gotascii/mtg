ActionController::Routing::Routes.draw do |map|
  map.resources :cards, :picks, :colors
  map.resources :decks do |decks|
    decks.resource :shopping_list, :only => [:show]
    decks.resource :complete_list, :only => [:show]
  end
  map.root :cards
end