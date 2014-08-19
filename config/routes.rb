Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  # Admin routes
  namespace :casein do
		resources :albums do
      resources :images
    end
    resources :posts
    resources :categories
  end
end
