Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects, only: [:index, :show, :new] do
    resources :positions, except: [ :index, :show ] do
      resources :user_positions, only: [ :create ]
    end
  end

  resources :user_positions, only: [ :update ]

  # resources :groups, only: [:index]

  # resources :users do
  #   resources :projects
  #   resources :groups
  # end

end
