Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  scope module: :users do
    root to:'homes#top'
    get '/search' => 'search#search'
    get 'about' => 'homes#about'
    get 'users/:id/unsubscribe' => 'users#unsubscribe',as: 'user_unsubscribe'
    post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
    delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
    resources :users, only:[:show,:edit,:update]
    resources :games do
      resources :comments, only:[:create,:destroy]
    end
  end

  namespace :admin do
    resources :users, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
    resources :games, only:[:index]
  end
end
