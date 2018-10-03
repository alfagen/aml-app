require 'rails_helper'

RSpec.describe Amlapp::DocumentKindFieldDefinitionsController, type: :controller do
  let(:user) { create :aml_operator, :administrator }
  let(:aml_document_kind_field_definition) { create(:aml_document_kind_field_definition) }
  let(:aml_document_kind) { aml_document_kind_field_definition.document_kind }

  before { login_user user }

  it '#create' do
    post :create, params: { document_kind_field_definition: attributes_for(:aml_document_kind_field_definition,
                                                                           document_kind_id: aml_document_kind.id) }
    expect(response).to be_redirect
  end

  it '#update' do
    put :update, params: {
      id: aml_document_kind_field_definition.id,
      document_kind_field_definition: { key: 'newkey', title: 'newtitle', document_kind_id: aml_document_kind.id }
    }
    expect(response).to be_redirect
  end
end
