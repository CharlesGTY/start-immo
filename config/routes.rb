Rails.application.routes.draw do
  root to: 'houses#index'
  devise_for :users
  resources :houses, only: [:index, :show, :create, :new]
  resources :documents, only: [:create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
