Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'


  # get 'auth/:provider', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#index"
  get 'users', to:'users#users'
  get 'tasks/new', to:'tasks#new'

end


# rails g model Task title:text comment:text value:integer 
