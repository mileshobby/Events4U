Rails.application.routes.draw do
  namespace :api do
    get 'tickets/create'
  end

  root "static_pages#root"

  namespace :api, { format: :json } do
    resources :users, only: [:create]
    resources :categories, only: [:index]
    resources :tickets, only: [:create]
    resources :bookmarks, only: [:create, :destroy]
    resource :session, only: [:create, :destroy]
    resources :events, only: [:create, :destroy, :update, :index, :show]
  end

  get 'api/events-filtered' => 'api/events#filter'
  get 'api/events-bookmarked' => 'api/events#bookmarked_events'
  get 'api/events-hosted' => 'api/events#hosted_events'
  get 'api/events-purchased' => 'api/events#attended_events'
end
