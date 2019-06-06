Rails.application.routes.draw do
  root to: 'home#index'

  resources :articles, only: %i(index new create)
end
