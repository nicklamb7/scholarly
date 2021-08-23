Rails.application.routes.draw do
  # Display all
  get "schools", to: "schools#index"
  # Display one
  get "schools/:id", to: "schools#show", as: :school
end
