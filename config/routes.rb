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

  # User routes
  resources :user_forms do
    resources :user_form_submissions, module: 'user_forms', only: %i(create new)
  end
end
