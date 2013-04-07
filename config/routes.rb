Angulator::Application.routes.draw do

  resources :clients
  resources :roadmaps
  resource :calendar
  resources :resources
  resources :monthly_resources
  resources :weekly_resources
  resources :directives
  root to: 'clients#index'
end
