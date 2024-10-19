Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  # Route non imbriquée pour la suppression de signets
  resources :bookmarks, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
