Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resource :registration, only: %i[new create]
  resource :session
  resource :password_reset
  resource :password

  root 'pages#index'
end
