Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update, :destroy] do


    resources :reviews, only: [:new, :create]

  end
  # Defines the root path route ("/")
  # root "articles#index"
end
