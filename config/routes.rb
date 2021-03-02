Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :index, :show, :edit, :create, :update]
  resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy]

  root to: 'homes#top'
  get "home/about" => "homes#about"
end
