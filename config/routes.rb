Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :update]
  resources :api_keys, only: [:create]
  resources :hotels, only: [:index, :create, :update, :destroy]
  resources :reservations, only: [:create]

  namespace :hotels do
    get 'availability_in_date_range', to: 'availability#index'
  end
end
