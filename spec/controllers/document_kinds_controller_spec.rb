require 'rails_helper'

RSpec.describe Amlapp::DocumentKindsController, type: :controller do
  describe '#base actions' do
    let(:aml_operator) { create(:aml_operator) }
    let(:aml_document_group) { create(:aml_document_group) }
    let(:aml_document_kind) { create(:aml_document_kind) }

    before { login_user(aml_operator) }

    context 'with registered operator' do
      it '#create' do
        post :create, params: { document_kind: attributes_for(:aml_document_kind, aml_document_group_id: aml_document_group.id) }
        expect(response).to be_successful
      end

      it '#update' do
        put :update, params: { document_kind: { aml_document_group_id: aml_document_kind.aml_document_group_id,
                                                title: 'new title',
                                                details: 'new details', position: 2 }, id: aml_document_kind.id }
        expect(response).to be_successful
      end

      it '#index' do
        get :index, params: { document_kind: attributes_for(:aml_document_kind, aml_document_group_id: aml_document_group.id) }
        expect(response).to be_successful
      end

      it '#show' do
        get :show, params: { id: aml_document_kind.id }
        expect(response).to be_successful
      end
    end
  end
end



