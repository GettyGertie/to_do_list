Rails.application.routes.draw do

  get 'signup' => 'users#new'

  get 'contact' => 'pages#contact'

  get 'help' => 'pages#help'

  root 'pages#home'

  resources :users
end
