Rails.application.routes.draw do
  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/create'

  get 'items/edit'

  get 'items/update'

  get 'items/destroy'

  get 'items/dashboard'

  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [ :new, :create, :edit, :update, :destroy ] do
      resources :reviews, only: [ :new, :create ]
    end
  end

  get "dashboard", to: "items#dashboard", as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
