RailsBase::Application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :posts
		resources :categories
	end

  devise_for :users
  root to: 'dashboard#index'
end
