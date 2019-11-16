Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    namespace :devise do
      get 'sign_out', to: 'sessions#destroy'
    end
  end

  root to: 'home#index'

  resources :articles

  namespace :front do
    resources :articles, only: %i(index)
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: %i(index)
    end
  end
end
