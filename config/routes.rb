Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'welcome#index'
  resources :users, only: :create
  get 'sign_up' => 'users#new', as: :sign_up
  resources :sessions, only: :create
  resources :notes
  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

  # /api/v1/notes.json
  # namespace versioning allows for custom api implementations for clients, etc
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :notes
    end
  end

  # This is totally a thing we could do with notes.
  # resources :users do
  #   # /users/1/notes
  #   resources :notes
  # end
end
