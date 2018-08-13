# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/orders')

  get 'login' => 'user_sessions#new', :as => :login
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  get '/users/:id' => 'passwords#edit', :as => :edit_password

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
