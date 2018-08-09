require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, params: { id: user.id, user: { email: user.email, password: user.password } }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      login_user(user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(302)
    end
  end
end
