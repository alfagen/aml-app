Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :document_kinds, only: %i[index new create]
  resources :clients, except: %i[edit update destroy] do
    post :document, on: :member
  end
  resources :client_documents, only: %i[show index] do
    member do
      put :accept
      put :reject
    end
  end
end
