Rails.application.routes.draw do
  post '/signup', to: 'auth#signup'
  post '/login', to: 'auth#login'

  post '/groups', to: 'groups#create'
  post '/groups/:group_id/memberships', to: 'group_memberships#create'
  delete '/groups/:group_id/memberships/:id', to: 'group_memberships#destroy'
  get '/groups/:id/users', to: 'groups#group_users'
  
  get '/users/:user_id/bills', to: 'bills#user_bills'
  post '/bills', to: 'bills#create'
  patch '/bills/:id', to: 'bills#update'
  delete '/bills/:id', to: 'bills#destroy'



  resources :groups, only: [:create, :index, :show, :update, :destroy]
  resources :bills, only: [:create, :update, :destroy]
end
