require 'rails_helper'

RSpec.describe AML::OrderDocumentsController, type: :controller do
  describe '#actions' do
    let(:aml_operator) { create(:operator) }
    let(:aml_document_kind) { create(:document_kind) }
    let!(:aml_client) { create(:client) }
    let(:aml_order) { create(:order, client_id: aml_client.id) }
    let(:aml_order_document) { create(:order_document, order_id: aml_order.id) }

    before { login_user(aml_operator) }

    context 'create with registered operator' do
      subject do
        post 'create', params: { order_document: attributes_for(:order_document,
                                                                order_id: aml_order.id,
                                                                document_kind_id: aml_document_kind.id,
                                                                client_id: aml_client.id) }
      end

      it 'saves the new client document to database' do
        expect { subject }.to change(AML::OrderDocument.all, :count).by(1)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
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
