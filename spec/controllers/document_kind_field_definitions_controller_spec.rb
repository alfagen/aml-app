require 'rails_helper'

RSpec.describe Amlapp::DocumentKindFieldDefinitionsController, type: :controller do
  describe '#base actions' do
    let(:aml_operator) { create(:operator) }
    let(:aml_document_kind) { create(:document_kind) }
    let(:aml_document_kind_field_definition) { create(:document_kind_field_definition) }

    before { login_user(aml_operator) }

    context 'with registered operator' do
      it '#create' do
        post :create, params: { document_kind_field_definition: attributes_for(:document_kind_field_definition,
                                                                               document_kind_id: aml_document_kind.id) }
        expect(response).to be_redirect
      end

      it '#update' do
        put :update, params: { document_kind_field_definition: { key: 'newkey',
                                                                 title: 'newtitle',
                                                                 document_kind_id: aml_document_kind.id },
                               id: aml_document_kind_field_definition.id }
        expect(response).to be_redirect
      end
    end
  end
end
