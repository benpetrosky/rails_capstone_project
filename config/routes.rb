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

resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :restore
  end
end

   resources :conversations, only: [:index, :show, :destroy] do
  collection do
    delete :empty_trash
  end
end

  resources :messages, only: [:new, :create]
end
