require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  describe '#create' do
    context 'with registered user' do
      let(:user) { create(:user) }

      before { login_user(user) }

      subject { post 'create', params: { client: attributes_for(:client) } }

      it 'saves the new client to database' do
        expect { subject }.to change(Client.all, :count).by(1)
      end

      it 'redirects to index view' do
        is_expected.to redirect_to(action: :index)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:client) { create(:client) }

    before { login_user(user) }

    subject { get :show, params: { id: client.id } }

    it { is_expected.to render_template(:show) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#index' do
    let(:user) { create(:user) }
    let(:client) { create(:client) }

    before { login_user(user) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
