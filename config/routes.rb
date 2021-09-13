Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :schools do
    resources :reviews, only: [ :new, :create ]
    resources :destinations
    resources :scholarships, only: [ :new, :create, :edit, :show, :update ]
  end
  resources :reviews, only: [ :destroy ]
  resources :scholarships, only: [ :index, :destroy ]
end
