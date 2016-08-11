Rails.application.routes.draw do
  get 'items/new'


  post 'new_cards' => 'cards#create'

  get 'new_item' => 'items#new'

  get 'mark_as_done' => 'items#mark_as_done'

  get 'undo' => 'items#undo'

  get 'other_todos' => 'items#index'

  get 'move_card' => 'cards#move_card'

  get 'choose_list' => 'cards#choose_list'

  get 'new_request' => 'requesters#new'

  get 'requested_cards' => 'requesters#requested_cards' 

  get 'accept_request' => 'requesters#accept_request'

  get 'requests_accepted_list' => 'requesters#requests_accepted_list'

  get 'reject_request' => 'requesters#reject_request'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'signup' => 'users#new'

  get 'contact' => 'pages#contact'

  get 'help' => 'pages#help'
 get 'list' => 'lists#show'
  get "lists" => 'lists#index'
  post 'lists' => 'lists#create'
  
root 'pages#home'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users

  resources :sessions

  resources :lists

  resources :cards

  resources :items, only: [:new, :create]

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]
end
