Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    put :complete, on: :member
  end
end
