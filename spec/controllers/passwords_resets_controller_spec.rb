require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  describe '#update' do
    context 'with new user' do
      let(:current_password) { generate :aml_password }
      let(:aml_operator) { create :aml_operator }

      before { login_user(aml_operator) }

      it 'создание пароля после регистрации пользователя' do
        put 'update', params: { user: { password: current_password,
                                        password_confirmation: current_password },
                                id: aml_operator.reset_password_token }
        expect(AML::Operator.authenticate(aml_operator.email, current_password)).to eq(aml_operator)
        expect(response).to be_redirect
      end
    end
  end
end
