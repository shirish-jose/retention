Retention::Application.routes.draw do

  devise_for :admins

  resources :purchases, only: :index

  resources :users,     only: :show

  root to: 'purchases#index'
end
