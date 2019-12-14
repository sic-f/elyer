Rails.application.routes.draw do
  root 'pages#home'
  get '/signup', to: 'users#new'

  # Authentication
  resources :users, only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  resources :places, only: %i[new create show edit update destroy]
end
