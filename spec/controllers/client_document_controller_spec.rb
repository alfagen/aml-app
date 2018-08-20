require 'rails_helper'

RSpec.describe ClientDocumentsController, type: :controller do
  describe '#create' do
    context 'with registered user' do
      let(:user) { create(:user) }
      let(:document_kind) { create(:document_kind) }
      let(:order) { create(:order) }
      let(:client_document) { create(:client_document) }

      before { login_user(user) }

      subject do
        post 'create', params: { client_document: attributes_for(:client_document,
                                                                 order_id: order.id,
                                                                 document_kind_id: document_kind.id) }
      end

      it 'saves the new client document to database' do
        expect { subject }.to change(ClientDocument.all, :count).by(1)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:document_kind) { create(:document_kind) }
    let(:order) { create(:order) }
    let(:client_document) { create(:client_document) }

    before { login_user(user) }

    subject { get :show, params: { id: client_document.id } }

    it { is_expected.to render_template(:show) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:user) { create(:user) }
    let(:document_kind) { create(:document_kind) }
    let(:order) { create(:order) }
    let(:client_document) { create(:client_document) }

    before { login_user(user) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
