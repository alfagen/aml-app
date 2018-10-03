require 'rails_helper'

RSpec.describe Amlapp::OrderDocumentsController, type: :controller do
  describe '#actions' do
    let(:aml_status) { create(:aml_status, key: 'guest') }
    let(:aml_operator) { create(:aml_operator) }
    let(:aml_document_kind) { create(:aml_document_kind) }
    let(:aml_client) { create(:aml_client, aml_status_id: aml_status.id) }
    let(:aml_order) { create(:aml_order, client_id: aml_client.id, aml_status_id: aml_status.id) }
    let(:aml_order_document) { create(:aml_order_document, order_id: aml_order.id) }

    before { login_user(aml_operator) }

    context '#update' do
      it 'update' do
        put 'update', params: { order_document: { order_id: aml_order.id,
                                                  document_kind: aml_document_kind.id,
                                                  client_id: aml_client.id }, id: aml_order_document.id }
      end
    end

    context '#show' do
      subject { get :show, params: { id: aml_order_document.id } }

      it { is_expected.to render_template(:show) }
      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#index' do
      subject { get :index }

      it { is_expected.to render_template(:index) }
      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
