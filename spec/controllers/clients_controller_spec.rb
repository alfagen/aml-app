require 'rails_helper'

RSpec.describe Amlapp::ClientsController, type: :controller do
  describe '#create' do
    context 'with registered operator' do
      let(:aml_operator) { create(:operator) }
      let(:aml_status) { create(:aml_status) }

      before { login_user(aml_operator) }

      subject { post 'create', params: { aml_client: attributes_for(:client, aml_status_id: aml_status.id ) } }

      it 'saves the new client to database' do
        expect { subject }.to change(AML::Client.all, :count).by(1)
      end

      it 'redirects to index view' do
        is_expected.to be_redirect
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    let(:aml_operator) { create(:operator) }
    let(:aml_client) { create(:client) }

    before { login_user(aml_operator) }

    subject { get :show, params: { id: aml_client.id } }

    it { is_expected.to render_template(:show) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:aml_operator) { create(:operator) }
    let(:aml_client) { create(:client) }

    before { login_user(aml_operator) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
