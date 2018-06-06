Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'projects#index'
  get "dashboard", to: "pages#dashboard", as: "dashboard"
  get "pages/linkedin_callback", to: "pages#linkedin", as: "linkedin"
  get "pages/additional_info", to: "pages#additional_info", as: "additional_info"
  get "projects/index_specific", to: "projects#index_specific", as: "index_specific"
  devise_scope :user do
    put 'users/additional_info_update', to: "registrations#additional_info_update", as: "additional_info_update"
  end


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
    resources :user_positions, only: [ :create, :show, :edit ]
  end

  resources :user_positions, only: [ :index, :update ]

  resources :users, only: [:show]

end
