Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    get '/arks' => 'arks#index'
    get '/arks/:id' => 'arks#show'
    post "/arks" => "arks#create"

  end
  
  post "/users" => "users#create"
  get '/users/:id' => 'users#show'
  delete '/users/:id' => 'users#destroy'
  patch '/users/:id' => 'users#update'
end
