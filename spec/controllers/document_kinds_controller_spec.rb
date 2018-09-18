require 'rails_helper'

RSpec.describe Amlapp::DocumentKindsController, type: :controller do
  describe '#base actions' do
    let(:aml_operator) { create(:operator) }
    let(:aml_document_kind) { create(:document_kind) }

    before { login_user(aml_operator) }

    context 'with registered operator' do
      it '#create' do
        post :create, params: { aml_document_kind: attributes_for(:document_kind) }
        expect(response).to be_success
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
