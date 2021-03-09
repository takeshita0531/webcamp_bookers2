Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :index, :show, :edit, :create, :update] 
  resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end 
  root to: 'homes#top'
  get "home/about" => "homes#about"
end
