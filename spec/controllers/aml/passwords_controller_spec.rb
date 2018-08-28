require 'rails_helper'

RSpec.describe Aml::PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:aml_user) { create(:user) }

      before { login_user(aml_user) }

      subject { put 'update', params: { aml_user: attributes_for(:user, password: 'new_password', password_confirmation: 'new_password') } }

      it 'chahge password' do
        expect { aml_user.reload.authenticate('new_password').to eq(true) }
      end

      it 'redirects to index view' do
        is_expected.to redirect_to(controller: :users, action: :index)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
