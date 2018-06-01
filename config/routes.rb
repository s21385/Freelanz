Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get "pages/linkedin_callback", to: "pages#linkedin", as: "linkedin"
  get "pages/additional_info", to: "pages#additional_info", as: "additional_info"
  devise_scope :user do
    put 'users/additional_info_update', to: "registrations#additional_info_update", as: "additional_info_update"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :positions, except: [ :index, :show ]
    resources :ratings, only: [ :new, :create ]
  end

  resources :groups

  resources :projects, only: [:index, :show] do
    resources :positions, except: [ :index, :show ]
  end

  resources :positions, except: [ :index, :show ] do
    resources :user_positions, only: [ :update, :create ]
  end



end
