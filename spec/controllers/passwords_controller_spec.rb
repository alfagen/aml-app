require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:new_password) { generate :aml_password }
      let(:current_password) { generate :aml_password }
      let(:user) { create :user }

      let(:user_params) do
        { password: new_password, password_confirmation: new_password, current_password: current_password }
      end

      before { login_user(user) }

      it 'изменение пароля с правильным текущим паролем' do
        put 'update', params: { change_password_form: attributes_for(:user, current_password: current_password,
                                                                            password: new_password,
                                                                            password_confirmation: new_password) }
        expect(User.authenticate(user.email, new_password)).to eq(user)
        expect(response).to be_successful
      end
    end
  end
end
