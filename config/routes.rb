Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  namespace :admin do
    get 'dashboard', to: 'admin#dashboard'
    get 'users', to: 'admin#users'
    get 'stores', to: 'admin#stores'
    get 'users/new', to: 'admin#new_user'
    post 'users', to: 'admin#create_user'
    delete 'logout', to: 'sessions#destroy', as: 'logout'
  end
end