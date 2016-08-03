Rails.application.routes.draw do

  get 'signup' => 'users#new'

  get 'contact' => 'pages#contact'

  get 'help' => 'pages#help'

  root 'pages#home'

  get 'login' => 'sessions#new'
  
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users

  resources :account_activations, only: [:edit]
end
