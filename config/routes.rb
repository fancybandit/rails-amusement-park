Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  post '/signout', to: 'sessions#destroy'

  post '/users/:id', to: 'users#ride'

  resources :session, only: [:create]

  resources :users, only: [:show, :new, :create]
  resources :attractions, only: [:show, :index, :new, :create, :edit, :update]
end
