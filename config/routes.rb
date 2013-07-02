Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :price_filters
  end
end
