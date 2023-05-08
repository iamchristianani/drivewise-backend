Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[index show create destroy]
      resources :reservations, only: %i[index show create update destroy]
      resources :users, only: %i[index show create update destroy]
    end
  end
end
