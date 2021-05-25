Rails.application.routes.draw do
  root to:'homes#top'
  get '/search' => 'search#search'
  get 'about' => 'homes#about'
  get 'users/:id/unsubscribe' => 'users#unsubscribe',as: 'user_unsubscribe'
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  devise_for :users
  resources :users, only:[:show,:edit,:update]
  resources :games do
    resources :comments, only:[:create,:destroy]
  end
end
