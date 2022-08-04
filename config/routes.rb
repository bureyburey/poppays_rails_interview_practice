Rails.application.routes.draw do
  resources :gig_payments do
    # PUT gig_payments/:id/set_complete
    put 'set_complete', :on => :member
  end
  resources :gigs do
    # PUT gigs/:id/set_completed
    put 'set_completed', :on => :member
  end
  resources :creators do
    # https://stackoverflow.com/a/17200296
    # GET creators/search
    get 'search', :on => :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
