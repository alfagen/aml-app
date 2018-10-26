require 'rails_helper'

RSpec.describe Amlapp::DocumentFieldsController, type: :controller do
  let!(:aml_status) { create(:aml_status, key: 'guest') }
  let(:user) { create :user }
  let!(:aml_document_field) { create(:aml_document_field) }

  before { login_user user }

  context '#update' do
    it 'update' do
      put 'update', params: { id: aml_document_field.id, value: 'another value' }
      expect(response).to be_redirect
    end
  end
end
