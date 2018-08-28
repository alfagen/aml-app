require 'rails_helper'

RSpec.describe Aml::ClientDocumentsController, type: :controller do
  describe '#actions' do
    let(:aml_user) { create(:user) }
    let(:aml_document_kind) { create(:document_kind) }
    let!(:aml_client) { create(:client) }
    let(:aml_order) { create(:order, client_id: aml_client.id) }
    let(:aml_client_document) { create(:client_document) }

    before { login_user(aml_user) }

    context 'create with registered user' do
      subject do
        post 'create', params: { aml_client_document: attributes_for(:client_document,
                                                                     order_id: aml_order.id,
                                                                     document_kind_id: aml_document_kind.id,
                                                                     client_id: aml_client.id) }
      end

      it 'saves the new client document to database' do
        expect { subject }.to change(Aml::ClientDocument.all, :count).by(1)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#show' do
      subject { get :show, params: { id: aml_client_document.id } }

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
