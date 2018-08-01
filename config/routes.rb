Rails.application.routes.draw do
  root 'client_documents#index'
  resources :document_kinds
  resources :clients
  resources :client_documents do
    member do
      put :accept
      put :reject
    end
  end
end
