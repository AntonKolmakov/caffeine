Rails.application.routes.draw do
  mount RailsSettingsUi::Engine, at: 'admin/settings'
  mount Ckeditor::Engine => '/ckeditor'

  root 'main_page#index'

  # Admin routes
  namespace :admin do
    root 'dashboard#index'

    resource :import, only: %i(create destroy)

    devise_for :user, path: ''
    resource :changelog, only: :show

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
        member do
          post :revert_version
          get  :version_page
        end
        resources :page_images
        resources :page_attachments, only: %i(create destroy)
      end
    end

  end

  # User routes
  resources :albums, only: :show
  resources :user_forms, only: :show do
    resources :user_form_submissions, module: 'user_forms', only: %i(create show)
  end

  get '/*page_path', to: 'pages#show', as: :page
end
