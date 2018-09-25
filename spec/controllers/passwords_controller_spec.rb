require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:aml_operator) { create(:aml_operator) }

      before { login_user(aml_operator) }
      subject { put 'update', params: { operator: attributes_for(:aml_operator, password: 'new_password', password_confirmation: 'new_password') } }

      it 'chahge password' do
        expect { aml_operator.reload.authenticate('new_password').to eq(true) }
      end

      it 'redirects to index view' do
        is_expected.to redirect_to(controller: :operators, action: :index)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
