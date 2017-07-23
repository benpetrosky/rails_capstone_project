Rails.application.routes.draw do
  root :to => 'users#index'

   get '/signup' => 'users#new'
   post '/users' => 'users#create'

   get '/signin' => 'sessions#new'
   get '/home' => 'sessions#home'
   post '/signin' => 'sessions#create'
   get '/signout' => 'sessions#destroy'
end
