require 'rails_helper'

RSpec.describe Amlapp::OrderDocumentsController, type: :controller do
  describe '#actions' do
    let(:user) { create :aml_operator, :administrator }
    let!(:aml_status) { create(:aml_status, key: 'guest') }
    let(:aml_document_kind) { create(:aml_document_kind) }

    let(:aml_order) { create :aml_order }
    let(:aml_order_document) { create :aml_order_document, order: aml_order }

    before { login_user user }

    it '#update' do
      # TODO: Загрузка изображения
      #
      put 'update', params: { order_document: { order_id: aml_order.id,
                                                document_kind: aml_document_kind.id }, id: aml_order_document.id }
    end

    it '#show' do
      get :show, params: { id: aml_order_document.id }
      expect(response).to be_successful
    end
  end
end
