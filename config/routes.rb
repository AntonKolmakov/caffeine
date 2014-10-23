Rails.application.routes.draw do
  mount RailsSettingsUi::Engine, at: 'admin/settings'
  mount Ckeditor::Engine => '/ckeditor'

  get '/mainpage', to: redirect('/')
  root 'main_page#index'

  # Admin routes
  namespace :admin do
    root 'dashboard#index'

    get 'import', to: 'import#import'
    get 'rollback', to: 'import#rollback'

    devise_for :user, path: ''

    with_options(except: :show) do
      resources :users
      resources :user_forms do
        resources :user_form_submissions, only: %i(index show destroy), shallow: true
      end
      resources :albums do
        resources :images do
          collection { post :sort }
        end
      end
      resources :pages do
        resources :page_images
        resources :page_attachments, only: %i(create destroy)
      end
    end

  end

  # User routes
  with_options(only: :show) do
    resources :pages, path: ''
    resources :albums
    resources :user_forms do
      resources :user_form_submissions, module: 'user_forms', only: :create
    end
  end
end
