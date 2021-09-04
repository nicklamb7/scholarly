Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :schools do
    resources :reviews, only: [ :new, :create ]
    resources :destinations, only: [ :index ]
  end
  resources :reviews, only: [ :destroy ]
end
