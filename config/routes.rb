# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, only: %i[index show]
  resources :slots, only: %i[index]
  root "orders#index"
end
