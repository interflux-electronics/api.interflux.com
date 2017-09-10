# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    jsonapi_resources :products
    jsonapi_resources :documents
  end
  namespace :public do
    jsonapi_resources :products, only: %i[index show]
    jsonapi_resources :documents, only: %i[index show]
  end
end
