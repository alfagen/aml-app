# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options Settings.default_url_options.symbolize_keys

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :user_sessions, only: %i[new create destroy]

  resources :password_resets, only: %i[new create edit update]
  resource :password, only: %i[edit update]

  scope module: :amlapp do
    root to: redirect('orders#index')

    get 'error' => 'application#error'
    delete 'reset_db' => 'application#reset_db'

    resources :operators, except: %i[show destroy] do
      member do
        put :block
        put :unblock
      end
    end

    concern :archivable do
      member do
        delete :archive
        post :restore
      end
    end

    resources :document_kinds, except: %i[destroy] do
      concerns :archivable
    end
    resources :statuses
    resources :document_group_to_statuses, only: %i[create destroy]
    resources :document_groups, except: %i[destroy] do
      concerns :archivable
    end
    resources :document_kind_field_definitions, only: %i[new create edit update] do
      concerns :archivable
    end
    resources :clients, except: %i[edit update destroy] do
      member do
        delete :reset
      end
    end
    resources :orders do
      member do
        put :done
        put :start
        put :accept
        put :reject
        put :cancel
      end
    end
    resources :document_fields, only: %i[edit update]
    resources :order_documents, only: %i[show index edit update] do
      member do
        put :accept
        put :reject
      end
    end
    resources :reason_rejects
  end
end
