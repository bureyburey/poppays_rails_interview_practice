Rails.application.routes.draw do
  resources :gig_payments
  resources :gigs
  resources :creators do
    # https://stackoverflow.com/a/17200296
    get 'search', :on => :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
