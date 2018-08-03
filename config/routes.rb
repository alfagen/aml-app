Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :document_kinds, only: %i[index new create]
  resources :clients, except: %i[edit update destroy]
  resources :client_documents, only: %i[show index new create] do
    member do
      put :accept
      put :reject
    end
  end
end
