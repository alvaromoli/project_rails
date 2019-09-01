Rails.application.routes.draw do
  resources :programs, only: [:index, :show, :search]
  resources :contacts, only: [:create]
  resources :postulations, only: [:create]

  root to: 'programs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
