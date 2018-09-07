require 'rails_helper'

RSpec.describe AML::UserSessionsController, type: :controller do
  let(:aml_user) { create(:user) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new, params: { user_session: { params: { login: '', password: '' } } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, params: { user_session: { params: { login: aml_user.email, password: aml_user.password } } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      login_user(aml_user)
      delete :destroy, params: { id: aml_user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
