require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:aml_operator) { create(:aml_operator) }
      let(:password) { 'random_password' }
      let(:new_password) { 'new_random_password' }

      before { login_user(aml_operator) }

      it 'создание пароля после регистрации пользователя' do
        put 'update', params: { operator: attributes_for(:aml_operator, password: password, password_confirmation: password) }
        expect(AML::Operator.authenticate(aml_operator.email, password)).to eq(aml_operator)
        expect(response).to be_redirect
      end

      it 'изменение пароля с правильным текущим паролем' do
        # сначала создаем пароль
        put 'update', params: { operator: attributes_for(:aml_operator, password: password, password_confirmation: password) }
        # потом его меняем
        put 'update', params: { operator: attributes_for(:aml_operator, current_password: password, password: new_password, password_confirmation: new_password) }
        expect(AML::Operator.authenticate(aml_operator.email, new_password)).to eq(aml_operator)
        expect(response).to be_redirect
      end

      it 'изменение пароля с невалидным/отсутствующим текущим паролем' do
        # сначала создаем пароль
        put 'update', params: { operator: attributes_for(:aml_operator, password: password, password_confirmation: password) }
        # потом пытаемся его менять без указания текущего пароля
        put 'update', params: { operator: attributes_for(:aml_operator, password: new_password, password_confirmation: new_password) }
        # получаем сообщение об ошибке из валидации в модели
        expect(aml_operator.errors.details[:current_password].first[:error]).to eq('Текущий пароль не верен.')
        expect(response).to be_successful
      end
    end
  end
end
