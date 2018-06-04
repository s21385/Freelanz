Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :positions, except: [ :index ]
    resources :ratings, only: [ :new, :create ]
  end

  resources :groups do
    resources :group_memberships, only: [:new, :create, :delete ]
    resources :discussions
  end

  resources :positions, except: [ :index, :show ] do
    resources :user_positions, only: [ :update, :create, :show, :edit ]
  end

  resources :user_positions, only: [ :index ]

  resources :users, only: [:show]

end
