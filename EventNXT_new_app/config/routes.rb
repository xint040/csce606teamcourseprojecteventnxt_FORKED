Rails.application.routes.draw do
  resources :email_services do
    member do
      get 'send_email'
    end
  end
  
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :events do
    resources :seats
    resources :guests
  end
  
  root "home#index"
end
