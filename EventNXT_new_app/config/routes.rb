Rails.application.routes.draw do
  get 'remember_me/clear_remember_me'
  get '/email_services/render_template', to: 'email_services#render_template'
  resources :email_services do
    member do
      get 'send_email'
    end
  end

  
  
  root 'home#index'

  post 'email_services/add_template', to: 'email_services#add_template', as: 'add_template'
  
  resources :email_templates, only: [:show], defaults: { format: 'json' }

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :events do
    resources :seats
    resources :guests
  end

end
