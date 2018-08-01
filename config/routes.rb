Rails.application.routes.draw do
  root 'client_documents#index'
  resources :document_kinds, only: %i[index new create]
  resources :clients, except: %i[edit update destroy] do
    post :document, on: :member
  end
  resources :client_documents, except: %i[new create] do
    member do
      put :accept
      put :reject
    end
  end
end
