Rails.application.routes.draw do
  root 'pages#home'

  resources :places, only: [:new, :create, :show, :edit]
end
