# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options Settings.default_url_options.symbolize_keys

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]

  resources :password_resets, only: %i[new create edit update]
  resource :password, only: %i[edit update]

  resources :operators, except: %i[show destroy] do
    member do
      put :block
      put :unblock
    end
  end

  # root to: redirect('/aml/orders')
  mount AML::Engine, at: '/aml', as: :aml
end
