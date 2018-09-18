require 'rails_helper'

RSpec.describe Amlapp::OrdersController, type: :controller do
  render_views

  let(:aml_operator) { create(:operator) }
  let(:aml_client) { create(:client) }

  describe 'actions' do
    context '#create' do
      before { login_user(aml_operator) }

      subject { post 'create', params: { order: attributes_for(:order, client_id: aml_client.id) } }

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#show' do
      let(:aml_order) { create(:order, client_id: aml_client.id) }

      before { login_user(aml_operator) }

      subject { get :show, params: { id: aml_order.id } }

      it { is_expected.to render_template(:show) }
      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#index another operator none state' do
      let(:another_operator) { create(:operator) }
      let!(:aml_order) { create(:order) }

      before { login_user(another_operator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'none' }
        expect(response.body).to include('First name', 'Не назначен')
      end
    end

    context '#index operator processing state' do
      let!(:aml_order) { create(:order, :processing, operator: aml_operator) }

      before { login_user(aml_operator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(response.body).to include('First name', aml_operator.email)
      end
    end

    context '#index another operator processing state' do
      let(:another_operator) { create(:operator) }
      let!(:aml_order) { create(:order, :processing, operator: aml_operator) }

      before { login_user(another_operator) }

      it 'should respond with a success status code (2xx) and not show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(response.body).to_not include('First name', aml_operator.email)
      end
    end

    context '#index administartor processing state' do
      let(:administrator) { create(:operator, role: 'administrator') }
      let!(:aml_order) { create(:order, :processing, operator: aml_operator) }

      before { login_user(administrator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(response.body).to include('First name', aml_operator.email)
      end
    end
  end
end
