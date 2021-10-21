Rails.application.routes.draw do
  devise_for :users
  root to: "schools#index"
  resources :schools do
    resources :reviews, only: [ :new, :create ]
    resources :destinations
    resources :scholarships, only: [ :new, :create, :edit, :show, :update ]
  end
  resources :reviews, only: [ :destroy ]
  resources :scholarships, only: [ :index, :destroy ]
  resources :articles
end
