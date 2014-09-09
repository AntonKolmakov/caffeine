Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'dashboard#index'

  devise_for :users

  # Admin routes
  namespace :casein do
    resources :user_forms
		resources :albums do
      resources :images do
        collection { post :sort }
      end
    end
    resources :posts do
      resources :post_attachments, only: %i(create destroy)
    end
    resources :categories
  end

  # User routes
  resources :user_forms do
    resources :user_form_submissions, module: 'user_forms', only: %i(create new)
  end

  resources :categories, shallow: true do
    resources :posts, only: %i(index show)
  end
end
