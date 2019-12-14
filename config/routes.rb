Rails.application.routes.draw do
  root 'pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'clearance/sessions#new', as: 'sign_in'

  # Authentication
  resources :users, only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :places, only: %i[new create show edit update destroy]
end
