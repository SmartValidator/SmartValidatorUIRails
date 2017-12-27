Rails.application.routes.draw do
  root 'pages#index'
  resources :data_sources, only: [:index]
  resources :conflicts, only: [:index]
  resources :settings, only: [:index]
end

