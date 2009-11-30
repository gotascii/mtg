ActionController::Routing::Routes.draw do |map|
  map.resources :cards, :decks, :picks, :colors
  map.root :cards
end