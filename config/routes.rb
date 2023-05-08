Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show, :create, :update, :destroy]
      resources :reservations, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
