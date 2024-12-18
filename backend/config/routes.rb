Rails.application.routes.draw do
  post '/signup', to: 'auth#signup'
  post '/login', to: 'auth#login'
  post '/groups', to: 'groups#create'

  resources :groups, only: [:create, :index, :show, :update, :destroy]
end
