require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  let(:aml_operator) { create(:operator) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new, params: { user_session: { params: { login: '', password: '' } } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, params: { user_session: { params: { login: aml_operator.email, password: aml_operator.password } } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      login_user(aml_operator)
      delete :destroy, params: { id: aml_operator.id }
      expect(response).to have_http_status(:success)
    end
  end
end
