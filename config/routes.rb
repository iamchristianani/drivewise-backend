Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy] do
        resources :reservations, only: %i[index show create update destroy] do
          resources :cars, only: %i[index show create destroy]
        end
      end
      resources :cars, only: %i[index show create destroy]
      resources :reservations, only: %i[index show]
    end
  end
end
