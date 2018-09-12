require 'rails_helper'

RSpec.describe AML::OrdersController, type: :controller do
  describe '#create' do
    context 'with registered operator' do
      let(:aml_operator) { create(:operator) }
      let(:aml_client) { create(:client) }

      before { login_user(aml_operator) }

      subject { post 'create', params: { order: attributes_for(:order, client_id: aml_client.id) } }

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    let(:aml_operator) { create(:operator) }
    let!(:aml_client) { create(:client) }
    let(:aml_order) { create(:order, client_id: aml_client.id) }

    before { login_user(aml_operator) }

    subject { get :show, params: { id: aml_order.id } }

    it { is_expected.to render_template(:show) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:aml_operator) { create(:operator) }
    let(:aml_client) { create(:client) }
    let(:aml_order) { create(:order) }

    before { login_user(aml_operator) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
