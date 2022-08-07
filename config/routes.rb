Rails.application.routes.draw do
  resources :gig_payments
  resources :gigs
  resources :creators
  resources :errors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #default route
  get ':controller(/:action(/:id))'

  #not found route
  get '*path', to: 'errors#not_found'
end
