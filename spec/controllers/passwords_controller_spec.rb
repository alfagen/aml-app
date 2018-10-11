require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:new_password) { generate :aml_password }
      let(:current_password) { generate :aml_password }
      let(:aml_operator) { create :aml_operator, password: current_password }

      let(:operator_params) do
        { password: new_password, password_confirmation: new_password, current_password: current_password }
      end

      before { login_user(aml_operator) }

      it 'change password' do
        put 'update', params: { operator: operator_params }
        expect(response).to be_redirect
        expect(aml_operator.reload.valid_password?(new_password)).to be_truthy
      end
    end
  end
end
