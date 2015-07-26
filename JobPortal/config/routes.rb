Rails.application.routes.draw do

  get     'login'       => 'sessions#new'
  post    'login'       => 'sessions#create'
  delete  'logout'      => 'sessions#destroy' 

  get     'register'    => 'users#new', as: :new_user
  get     'change-password' => 'users#change_password', as: :change_password
  resources :users

  get     'available-jobs'  => 'jobs#available_jobs', as: :available_jobs
  resources :jobs

  post    'apply-job/:job_id'       => 'job_applications#apply', as: :apply_job

  get     '/:page'      => 'pages#show'
  root    'pages#show', page: 'home'
end
