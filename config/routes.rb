Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :schools do
    resources :reviews, only: [ :new, :create ]
    resources :destinations
  end
  resources :reviews, only: [ :destroy ]
end
