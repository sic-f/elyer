Rails.application.routes.draw do
  root 'pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'clearance/sessions#new', as: 'sign_in'
  delete '/logout', to: 'clearance/sessions#destroy', as: 'sign_out'

  # Authentication
  resources :users, only: %i[show create] do
    get :places, on: :member
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]

    resources :places, only: %i[new create show edit update destroy], shallow: true
  end

  resource :session, controller: 'clearance/sessions', only: [:create]
end
