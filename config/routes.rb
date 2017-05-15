Rails.application.routes.draw do
  root "static_pages#root"

  namespace :api, { format: :json } do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end
