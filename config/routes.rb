Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mytrucks', to: 'trucks#mytrucks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :loads
  resources :trucks, only: [:new, :create]
  resources :freights, only: [:new, :create]
  resources :users, only: [:show, :index]
end
