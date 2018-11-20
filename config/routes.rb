# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options Settings.default_url_options.symbolize_keys

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount AML::Engine, at: '/aml'

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]

  resources :password_resets, only: %i[new create edit update]
  resource :password, only: %i[edit update]

  resource :locale, only: :update
  resource :user, only: %i[edit update]

  scope module: :amlapp do
    root to: redirect('aml/orders#index')

    get 'error' => 'application#error'
    delete 'reset_db' => 'application#reset_db'
    delete 'drop_clients' => 'application#drop_clients'
    delete 'drop_orders' => 'application#drop_orders'
  end
end
