require 'rails_helper'

RSpec.describe Amlapp::OrdersController, type: :controller do
  render_views

  let(:aml_operator) { create(:aml_operator) }
  let(:aml_status) { create(:aml_status, key: 'guest') }
  let(:aml_client) { create(:aml_client, aml_status_id: aml_status.id) }

  describe 'actions' do
    context '#create' do
      before { login_user(aml_operator) }

      subject { post 'create', params: { order: attributes_for(:aml_order, client_id: aml_client.id, aml_status_id: aml_status.id) } }

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#show' do
      let(:aml_order) { create(:aml_order, client_id: aml_client.id, aml_status_id: aml_status.id) }

      before { login_user(aml_operator) }

      subject { get :show, params: { id: aml_order.id } }

      it { is_expected.to render_template(:show) }
      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end

    context '#index another operator none state' do
      let(:another_operator) { create(:aml_operator) }
      let!(:aml_order) { create(:aml_order, aml_status_id: aml_status.id) }

      before { login_user(another_operator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'none' }
        expect(aml_order.readable_by?(another_operator)).to be true
      end
    end

    context '#index operator processing state' do
      let!(:aml_order) { create(:aml_order, :processing, operator: aml_operator, aml_status_id: aml_status.id) }

      before { login_user(aml_operator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(aml_order.readable_by?(aml_operator)).to be true
      end
    end

    context '#index another operator processing state' do
      let(:another_operator) { create(:aml_operator) }
      let!(:aml_order) { create(:aml_order, :processing, operator: aml_operator, aml_status_id: aml_status.id) }

      before { login_user(another_operator) }

      it 'should respond with a success status code (2xx) and not show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(aml_order.readable_by?(another_operator)).to be false
      end
    end

    context '#index administartor processing state' do
      let(:administrator) { create(:aml_operator, role: 'administrator') }
      let!(:aml_order) { create(:aml_order, :processing, operator: aml_operator, aml_status_id: aml_status.id) }

      before { login_user(administrator) }

      it 'should respond with a success status code (2xx) and show order' do
        get :index, params: { workflow_state: 'processing' }
        expect(aml_order.readable_by?(administrator)).to be true
      end
    end
  end
end
