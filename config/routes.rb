Rails.application.routes.draw do
  root to: 'students#index'

  resources :students, only: [:create] do
    collection do
      post :pick
    end
  end
end
