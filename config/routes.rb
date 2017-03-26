Rails.application.routes.draw do

  resources :desserts_categories do
    resources :desserts, shallow: true
  end

  get 'contacts' => 'contacts#index'

  root 'sessions#home'
  get 'users' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update', as: :user
  delete 'users/:id' => 'users#destroy', as: :delete_user

  get 'login' => 'sessions#login'
  post 'login_attempt' => 'sessions#login_attempt'
  get 'logout' => 'sessions#logout'
  get 'home' => 'sessions#home'
  get 'profile' => 'sessions#profile'
  get 'setting' => 'sessions#setting'

  get '/change_locale/:locale' => 'settings#change_locale', as: :change_locale
end