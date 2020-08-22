Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'mytrucks', to: 'trucks#mytrucks'
  get 'my_freights', to: 'freights#my_freights'
  get 'set_nick', to: 'users#set_nick'
  post 'set_nick', to: 'users#udate_nick'
  # post 'cotizacion', to: 'pages#cotizacion'
  get 'cotizacion', to: 'pages#cotizacion'
  get 'myloads', to: 'loads#myloads'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :loads, only: [:new, :create, :new, :index, :show]
  resources :trucks, only: [:new, :create]
  resources :freights
  resources :pickings, only: [:new, :create, :index]
  resources :users, only: [:show, :index, :update]
  resources :reviews, only: [ :new, :create ]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
