Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: :create
  get 'sign_up' => 'users#new', as: :sign_up
  resources :sessions, only: :create
  resources :notes
  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

  # This is totally a thing we could do with notes.
  # resources :users do
  #   # /users/1/notes
  #   resources :notes
  # end
end
