require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:aml_operator) { create(:aml_operator) }
      let(:password) { 'new_random_password' }

      before { login_user(aml_operator) }

      before do
        put 'update', params: { operator: attributes_for(:aml_operator, password: password, password_confirmation: password) }
      end

      it 'chahge password' do
        expect(AML::Operator.authenticate(aml_operator.email, password)).to eq(aml_operator)
      end

      it 'redirects to index view' do
        expect(response).to be_successful
      end
    end
  end
end
