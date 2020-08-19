Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mytrucks', to: 'trucks#mytrucks'
  get 'set_nick', to: 'users#set_nick'
  post 'set_nick', to: 'users#udate_nick'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :loads
  resources :trucks, only: [:new, :create]
  resources :freights, only: [:new, :create, :index, :show]
  resources :pickings, only: [:new, :create, :index]
  resources :users, only: [:show, :index, :update]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
