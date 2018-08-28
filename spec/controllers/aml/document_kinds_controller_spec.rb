require 'rails_helper'

RSpec.describe Aml::DocumentKindsController, type: :controller do
  describe '#base actions' do
    let(:aml_user) { create(:user) }
    let(:aml_document_kind) { create(:document_kind) }

    before { login_user(aml_user) }

    context 'with registered user' do
      it '#create' do
        post :create, params: { aml_document_kind: attributes_for(:document_kind) }
        expect(subject).to redirect_to(assigns(:aml_document_kind))
      end

      it '#index' do
        get :index
        expect(response).to be_success
      end

      it '#show' do
        get :show, params: { id: aml_document_kind.id }
        expect(response).to be_success
      end
    end
  end
end
