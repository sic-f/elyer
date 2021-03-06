Rails.application.routes.draw do
  root 'pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'clearance/sessions#new', as: 'sign_in'
  delete '/logout', to: 'clearance/sessions#destroy', as: 'sign_out'

  # Authentication
  resources :users, only: %i[show create edit update] do
    get :places, on: :member
    delete :destroy_avatar, on: :member
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]

    resources :places, only: %i[new create show edit update destroy], shallow: true do
      resources :images, only: %i[show create edit update destroy], shallow: true do
        resources :comments, only: %i[create edit update destroy], shallow: true
      end
      resources :reviews, only: %i[new create edit update destroy]
    end

    resources :comments
  end

  resource :password, controller: 'clearance/passwords', only: %i[new create]

  resource :session, controller: 'clearance/sessions', only: [:create]
end
