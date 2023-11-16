Rails.application.routes.draw do
  get 'remember_me/clear_remember_me'
  get '/email_services/render_template', to: 'email_services#render_template'
  get '/book_seats/:rsvp_link', to: 'guests#book_seats', as: 'book_seats'

  resources :email_services do
    member do
      get 'send_email'
      #get 'show'
      #get 'index'
    end
  end

  
  
  root 'home#index'

  post 'email_services/add_template', to: 'email_services#add_template', as: 'add_template'
  patch '/update_commited_seats/:rsvp_link', to: 'guests#update_commited_seats', as: 'update_commited_seats'

  
  resources :email_templates, only: [:show], defaults: { format: 'json' }

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :events do
    resources :seats
    resources :guests
  end

  #resources :seats
  #resources :guests

end
