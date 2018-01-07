Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  resources :data_sources, only: [:index]
  resources :conflicts, only: [:index]
  resources :settings, only: [:index]
  post 'settings/set_key' => 'settings#set_key', :as => :set_settings_key
  resources :own_prefixes, only: [:index, :new, :create]
  resources :watched_prefixes, only: [:new, :create]
  resources :analyzed_announcements, only: [:show]
  resource :simulator, only: [:show]
  resource :self_overview, only: [:show], :controller => :self_overview
  resource :router_status, only: [:show]
  resources :payload_roas, only: [:index]
  get 'graphs/conflict_status' => 'graphs#conflict_status', :as => :conflict_status_graph
  get 'graphs/bgp_status' => 'graphs#bgp_status', :as => :bgp_status_graph
  get 'graphs/timeline_conflicts' => 'graphs#timeline_conflicts', :as => :timeline_conflicts_graph
  get 'graphs/payload_roas' => 'graphs#payload_roas', :as => :payload_roas_graph

  namespace 'smart_validator_db' do
    resources :announcements, only: [:index]
    resources :watched_announcements, only: [:index]
    resources :user_announcements, only: [:index]
    resources :validated_roas, only: [:index]
    resources :payload_roas, only: [:index]
    resources :validated_roas_verified_announcements, only: [:index]
    resources :rtr_status_entries, only: [:index]
    resources :watched_prefixes, only: [:create]
  end

end
