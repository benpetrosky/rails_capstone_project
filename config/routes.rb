Rails.application.routes.draw do
  root :to => 'users#index'

   get '/signup' => 'users#new'
   post '/users' => 'users#create'

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   get '/signout' => 'sessions#destroy'

   get '/all' => 'users#list'

   resources :users

   resources :conversations, only: [:index, :show, :destroy] do
     member do
       post :reply
     end
   end
  resources :messages, only: [:new, :create]
end
