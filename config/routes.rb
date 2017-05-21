Rails.application.routes.draw do
  root "static_pages#root"

  namespace :api, { format: :json } do
    resources :users, only: [:create]
    resources :categories, only: [:index]
    resources :bookmarks, only: [:create, :destroy]
    resource :session, only: [:create, :destroy]
    resources :events, only: [:create, :destroy, :update, :index, :show]
  end

  get 'api/events-filtered' => 'api/events#filter'
end
