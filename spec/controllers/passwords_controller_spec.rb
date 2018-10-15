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

      it 'создание пароля после регистрации пользователя' do
        put 'update', params: { operator: attributes_for(:aml_operator, password: current_password, password_confirmation: current_password) }
        expect(AML::Operator.authenticate(aml_operator.email, current_password)).to eq(aml_operator)
        expect(response).to be_redirect
      end

      it 'изменение пароля с правильным текущим паролем' do
        # TODO вынести в before и создавать через factory вместо запроса
        # сначала создаем пароль
        put 'update', params: { operator: attributes_for(:aml_operator, password: current_password, password_confirmation: current_password) }
        # потом его меняем
        put 'update', params: { operator: attributes_for(:aml_operator, current_password: current_password,
                                                                        password: new_password,
                                                                        password_confirmation: new_password) }
        expect(AML::Operator.authenticate(aml_operator.email, new_password)).to eq(aml_operator)
        expect(response).to be_redirect
      end
    end
  end
end
