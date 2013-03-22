Angulator::Application.routes.draw do
  resources :clients
  resources :roadmaps
  resource :calendar
  resources :directives
  root to: 'clients#index'
end
