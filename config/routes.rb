Rails.application.routes.draw do
  # root to: 'houses#index'
  devise_for :users
  root to: 'pages#home'
  resources :houses, only: [:index, :show, :create, :new] do
    resources :documents, only: [:create, :index, :show]
  end
  resources :owners, only: [:create, :new]
  get 'houses/:id/doc', to: 'houses#show_doc', as: :house_doc
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
