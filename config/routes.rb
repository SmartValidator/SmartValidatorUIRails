Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  resources :data_sources, only: [:index]
  resources :conflicts, only: [:index]
  resources :settings, only: [:index]

  namespace 'smart_validator_db' do
    resources :announcements, only: [:index]
    resources :validated_roas, only: [:index]
    resources :validated_roas_verified_announcements, only: [:index]
  end

end

