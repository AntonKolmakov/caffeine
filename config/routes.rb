Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#show', id: 1

  devise_for :users

  # Admin routes
  namespace :casein do
    resources :user_forms
		resources :albums do
      resources :images do
        collection { post :sort }
      end
    end
    resources :pages do
      resources :page_attachments, only: %i(create destroy)
    end
  end

  # User routes
  resources :user_forms do
    resources :user_form_submissions, module: 'user_forms', only: %i(create new)
  end

  resources :pages, only: %i(index show)
end
