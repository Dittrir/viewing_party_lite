Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/discover', to: 'users#discover'

  post '/users/:id/movies', to: 'user_movies#search'
  get '/users/:id/movies', to: 'user_movies#index'
  get '/users/:user_id/movies/:id', to: 'user_movies#show'
  get '/users/:user_id/movies/:id/viewing-party/new', to: 'parties#new'
  post '/users/:user_id/movies/:id/viewing-parties', to: 'parties#create'
end
