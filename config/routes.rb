Rails.application.routes.draw do
  devise_for :users
  root to: 'courses#index'

  resources :courses, only: %i(new create index)
end
