Rails.application.routes.draw do
  resources :programs, only: [:index, :show, :search]
  resources :contacts, only: [:create]
  resources :postulations, only: [:create]

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }, skip: :registrations

  get '/ccenter', to: 'ccenter#index'
  get '/ccenter/contacts/:id', to: 'contacts#show', as: 'ccenter_contact'
  get '/ccenter/postulations/:status', to: 'postulations#statuses'

  root to: 'programs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
