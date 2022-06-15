Rails.application.routes.draw do
  resources :orders, only: %i[index show] do
    member do
      post :cancel
    end
  end

  resources :slots, only: %i[index]
  root "orders#index"
end
