require 'rails_helper'

RSpec.describe DocumentKindsController, type: :controller do
  describe '#base actions' do
    let(:user) { create(:user) }
    let(:document_kind) { create(:document_kind) }

    before { login_user(user) }

    context 'with registered user' do
      it '#create' do
        post :create, params: { document_kind: attributes_for(:document_kind) }
        expect(subject).to redirect_to(assigns(:document_kind))
      end

      it '#index' do
        get :index
        expect(response).to be_success
      end

      it '#show' do
        get :show, params: { id: document_kind.id }
        expect(response).to be_success
      end
    end
  end
end
