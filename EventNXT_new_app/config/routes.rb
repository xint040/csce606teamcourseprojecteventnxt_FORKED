Rails.application.routes.draw do
  get 'token/exchange'
  get 'remember_me/clear_remember_me'
  get '/book_seats/:rsvp_link', to: 'guests#book_seats', as: 'book_seats'
  get '/email_services/new_email_template', to: 'email_services#new_email_template', as: 'new_email_template'
  get '/email_services/email_template/:id', to: 'email_services#edit_email_template', as: 'edit_email_template'
  get '/email_services/render_email_template', to: 'email_services#render_template', as: 'render_email_template'
  get 'destroy_email_template/:id', to: 'email_services#destroy_email_template', as: 'destroy_email_template'

  get '/referral/:ref_code', to: 'referrals#refer', as: 'referral'

  get '/refer_a_friend', to: 'referrals#new', as: 'new_referral'
  post '/refer_a_friend', to: 'referrals#create', as: 'create_referral'

  get '/buy_tickets', to: 'tickets#new', as: 'new_ticket_purchase'

  resources :email_services do
    member do
      get 'send_email'
      #get 'show'
      #get 'index'
    end
  end
<<<<<<< HEAD
  
  resources :tickets, only: [:new, :create]

  post '/import_guests_csv', to: 'guests#import_guests_csv'# Defines a route for the upload_existing_plan action on guests controller.
=======

<<<<<<< HEAD
  #resources :guests
  #post '/import_guests_csv', to: 'guests#import_guests_csv'
>>>>>>> 5bf0df4 (upload)

  resources :guests do
    collection do
      post '/import_guests_csv', to: 'guests#import_guests_csv'
      get :import
      post :import, to: 'guests#process_import'
      get :new_guest, to: 'guests#new_guest'
    end
  end


  
=======
  resources :tickets, only: [:new, :create]
>>>>>>> 6ac0f0c (upload manage guest feature done)
  
  root 'home#index'

  post 'email_services/add_email_template', to: 'email_services#add_email_template', as: 'add_email_template'
  patch '/email_services/email_template/:id/update', to: 'email_services#update_email_template', as: 'update_email_template'
  patch '/update_commited_seats/:rsvp_link', to: 'guests#update_commited_seats', as: 'update_commited_seats'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'}


  get '/redirect_after_signout', to: 'redirect#after_signout' # new code


  devise_scope :user do
    post 'oauth/authorize', to: 'users/authorizelogin#authorize_event360'
    get 'oauth/authorize', to: 'users/authorizelogin#authorize_event360'
    get 'auth/events360/callback', to: 'users/omniauth_callbacks#events360'
    post 'auth/events360/callback', to: 'users/omniauth_callbacks#events360'
  end

  resources :events do
    resources :seats
    resources :guests do 
      collection do
        #get 'new_guest', to: 'guests#new_guest'
        post 'import_csv', to: 'guests#import_guests_csv'
      end
    end
  end

 #resources :seats
  #resources :guests
end