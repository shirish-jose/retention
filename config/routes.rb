Retention::Application.routes.draw do

  resources :purchases, only: :index
  resources :users,     only: :show
  root to: 'purchases#index'
end
