Angulator::Application.routes.draw do
  resources :clients
  resource :calendar
  root to: 'clients#index'
end
