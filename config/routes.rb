# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/orders')

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'login' => 'user_sessions#new', :as => :login
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resource :password_reset, only: %i[update edit create]
  resource :password, only: %i[edit update]
  resources :user_sessions, only: %i[create new destroy]
  resources :users, except: %i[show destroy] do
    member do
      put :block
      put :unblock
    end
  end
  resources :document_kinds, only: %i[index new create]
  resources :clients, except: %i[edit update destroy]
  resources :orders do
    member do
      put :in_process
      put :accept
      put :reject
    end
  end
  resources :client_documents, only: %i[show index new create] do
    member do
      put :accept
      put :reject
    end
  end
end
