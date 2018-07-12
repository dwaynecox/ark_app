Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # post 'user_token' => 'user_token#create'
  namespace :api do
   
  end
  
  post "/users" => "users#create"
end
