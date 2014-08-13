RailsBase::Application.routes.draw do
  resources :posts

  resources :categories

  devise_for :users
  root to: 'dashboard#index'
end
