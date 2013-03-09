Angulator::Application.routes.draw do
  resources :clients
  root to: 'clients#index'
end
