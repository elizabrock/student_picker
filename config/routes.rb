Rails.application.routes.draw do
  root to: 'students#index'

  resources :students, only: [:create]
end
