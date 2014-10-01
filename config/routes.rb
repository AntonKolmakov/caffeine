Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/mainpage', to: redirect('/')
  root 'pages#show', id: Page.root.slug

  devise_for :users

  # Admin routes
  namespace :admin do
    resources :users, exept: :show
    resources :user_forms, except: :show do
      resources :user_form_submissions, only: %i(index show destroy), shallow: true
    end
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
  resources :user_forms, only: [:show] do
    resources :user_form_submissions, module: 'user_forms', only: :create
  end

  get '/admin', to: 'admin/pages#index'
  resources :pages, only: :show, path: ''
end
