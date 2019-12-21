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

  namespace :vue do
    resources :articles, only: %i(index show new edit) do
      resources :comments, only: %i(index new)
    end
  end

  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments, only: %i(index create)
      end
    end
  end
end
