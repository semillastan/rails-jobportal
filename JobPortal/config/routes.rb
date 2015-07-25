Rails.application.routes.draw do

  get     'login'       => 'sessions#new'
  post    'login'       => 'sessions#create'
  delete  'logout'      => 'sessions#destroy' 

  get     'register'    => 'users#new', as: :new_user
  resources :users

  get     '/:page'      => 'pages#show'
  root    'pages#show', page: 'home'
end
