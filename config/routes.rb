Rails.application.routes.draw do
  get "products/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/create"
  root 'products#index' # Головна сторінка (зробимо пізніше)

  # Реєстрація користувачів
  resources :users, only: [:new, :create]

  # Сесії для входу/виходу
  resources :sessions, only: [:new, :create, :destroy]
end
