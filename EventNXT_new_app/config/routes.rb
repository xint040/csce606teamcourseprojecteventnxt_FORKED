Rails.application.routes.draw do
  get 'remember_me/clear_remember_me'
  resources :email_services do
    member do
      get 'send_email'
    end
  end

  root 'home#index'
  
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :events do
    resources :seats
    resources :guests
  end

end
