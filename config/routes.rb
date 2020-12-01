Rails.application.routes.draw do
  get 'productions/index'
  get 'productions/show'
  root 'pages#home'
  get '/home', to: 'pages#home'
  get 'pages/help'
  get 'pages/contact'
  resources :productions, only: [:index, :show]
  resources :production_details, only: [:index, :show]
  namespace :admin do 
  	resources :productions
  	resources :production_details
  end	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
