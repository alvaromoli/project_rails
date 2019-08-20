Rails.application.routes.draw do
  devise_for :contacts, controllers: {
       sessions: 'contacts/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
