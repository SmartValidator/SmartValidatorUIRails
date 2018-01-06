Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  resources :data_sources, only: [:index]
  resources :conflicts, only: [:index]
  resources :settings, only: [:index]
  post 'settings/set_key' => 'settings#set_key', :as => :set_settings_key
  resources :own_prefixes, only: [:index, :new, :create]
  resources :analyzed_announcements, only: [:show]
  get 'graphs/conflict_status' => 'graphs#conflict_status', :as => :conflict_status_graph
  get 'graphs/bgp_status' => 'graphs#bgp_status', :as => :bgp_status_graph
  get 'graphs/timeline_conflicts' => 'graphs#timeline_conflicts', :as => :timeline_conflicts_graph
  resource :simulator, only: [:show]
  resource :router_status, only: [:show]

  namespace 'smart_validator_db' do
    resources :announcements, only: [:index]
    resources :local_announcements, only: [:index]
    resources :validated_roas, only: [:index]
    resources :validated_roas_verified_announcements, only: [:index]
    resources :rtr_status_entries, only: [:index]
  end

end

