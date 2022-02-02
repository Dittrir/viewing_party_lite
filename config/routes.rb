Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users

  get '/register', to: 'welcome#register'
  post '/register', to: 'welcome#create'
  get '/users/:id/discover', to: 'users#discover'

  post '/search', to: 'movies#search'
end
