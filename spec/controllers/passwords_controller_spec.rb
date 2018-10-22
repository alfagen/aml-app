require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:new_password) { generate :aml_password }
      let(:current_password) { generate :aml_password }
      let(:aml_operator) { create :aml_operator }

      let(:operator_params) do
        { password: new_password, password_confirmation: new_password, current_password: current_password }
      end

      before { login_user(aml_operator) }

      it 'изменение пароля с правильным текущим паролем' do
        put 'update', params: { change_password_form: attributes_for(:aml_operator, current_password: current_password,
                                                                                    password: new_password,
                                                                                    password_confirmation: new_password,
                                                                                    locale: I18n.available_locales.sample) }
        expect(AML::Operator.authenticate(aml_operator.email, new_password)).to eq(aml_operator)
        expect(response).to be_successful
      end
    end
  end
end
