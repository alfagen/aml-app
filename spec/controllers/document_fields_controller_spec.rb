require 'rails_helper'

RSpec.describe Amlapp::DocumentFieldsController, type: :controller do
  let(:aml_status) { create(:aml_status, key: 'guest') }
  let(:administrator) { create(:aml_operator, role: 'administrator') }
  let(:aml_document_kind) { create(:aml_document_kind) }
  let(:aml_document_kind_field_definition) { create(:aml_document_kind_field_definition, document_kind: aml_document_kind) }
  let(:aml_document_field) { create(:aml_document_field, definition: aml_document_kind_field_definition, order_document: aml_order_document) }
  let(:aml_client) { create(:aml_client, aml_status: aml_status) }
  let(:aml_order) { create(:aml_order, client_id: aml_client.id, aml_status: aml_status) }
  let(:aml_order_document) { create(:aml_order_document, order: aml_order) }

  before { login_user(administrator) }

  context '#update' do
    it 'update' do
      put 'update', params: { id: aml_document_field.id, value: 'another value', order_document_id: aml_order_document.id, document_kind_field_definition_id: aml_document_kind_field_definition.id }
      expect(response).to be_redirect
    end
  end
end
