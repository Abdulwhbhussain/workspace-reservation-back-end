Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
       namespace :workspace do
        get 'workspaces' => 'workspace#index'
        get 'details/:id' => 'workspace#show'

        post 'new_workspace' => 'workspace#create'
        delete 'delete_workspace' => 'workspace#destroy'
      end
      end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :sessions, only: [:create]
      resources :test, only: [:index]
      # resources :workspaces, only: [:index, :show]
      # resources :reservations, only: [:index, :show, :create, :destroy]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
