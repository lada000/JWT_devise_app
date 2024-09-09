Rails.application.routes.draw do

  root to: 'home#index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get '/secured', to: 'secured#index'

  get "up" => "rails/health#show", as: :rails_health_check

end
