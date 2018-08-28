require 'rails_helper'

RSpec.describe Aml::OrdersController, type: :controller do
  describe '#create' do
    context 'with registered user' do
      let(:aml_user) { create(:user) }
      let(:aml_client) { create(:client) }

      before { login_user(aml_user) }

      subject { post 'create', params: { aml_order: attributes_for(:order, client_id: aml_client.id) } }

      it 'saves the new order to database' do
        expect { subject }.to change(Aml::Order.all, :count).by(1)
      end

      it 'redirects to show view' do
        expect(subject).to redirect_to(Aml::Order.last)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    let(:aml_user) { create(:user) }
    let!(:aml_client) { create(:client) }
    let(:aml_order) { create(:order, client_id: aml_client.id) }

    before { login_user(aml_user) }

    subject { get :show, params: { id: aml_order.id } }

    it { is_expected.to render_template(:show) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:aml_user) { create(:user) }
    let(:aml_client) { create(:client) }
    let(:aml_order) { create(:order) }

    before { login_user(aml_user) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
