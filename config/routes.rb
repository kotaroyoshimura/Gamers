Rails.application.routes.draw do
  root to:'homes#top'
  get 'about' => 'homes#about'
  get 'users/:id/unsubscribe' => 'users#unsubscribe',as: 'user_unsubscribe'
  devise_for :users
  resources :users, only:[:show,:edit,:update]
end
