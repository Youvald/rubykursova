Rails.application.routes.draw do
  # Головна сторінка магазину
  root 'products#index'

  # Ресурси для товарів
  resources :products

  # Реєстрація користувачів
  resources :users, only: [:new, :create]

  # Сесії для входу/виходу
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'sessions'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    resources :products
    # Додайте інші ресурси, якщо потрібно
  end
  resources :carts, only: [:show] do
    post 'add_item', on: :collection
  end

  resources :products, only: [:index, :show]



end
