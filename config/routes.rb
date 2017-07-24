Rails.application.routes.draw do
  root :to => 'users#index'

   get '/signup' => 'users#new'
   post '/users' => 'users#create'

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   get '/signout' => 'sessions#destroy'

   get '/all' => 'users#list'

   resources :users do
     resources :messages
   end
end
