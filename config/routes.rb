Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  # Admin routes
  namespace :casein do
    resources :user_forms
    resources :posts
    resources :categories
  end
end
