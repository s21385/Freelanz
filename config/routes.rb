Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
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
