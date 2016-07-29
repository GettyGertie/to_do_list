Rails.application.routes.draw do
  get 'signup' => 'users#new'

  get 'contact' => 'pages#contact'

  get 'help' => 'pages#help'

  root 'pages#home'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
