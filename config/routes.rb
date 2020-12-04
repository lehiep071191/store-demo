Rails.application.routes.draw do
  get 'infors/show'
  get 'update_details/update'
  get 'users/show'
  get 'admin/home', to: 'admin/pages#index'
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  get 'productions/index'
  get 'productions/show'
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  resources :users, only: [:show]
  resources :productions, only: [:index, :show]
  resources :production_details, only: [:index, :show]
  resources :carts
  resources :orders
  resources :infors
  namespace :admin do
    resources :orders
  	resources :productions
  	resources :production_details
  end	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
