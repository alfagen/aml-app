require 'rails_helper'

RSpec.describe Amlapp::OperatorsController, type: :controller do
  let(:administrator) { create(:aml_operator, role: 'administrator') }
  let(:operator) { create(:aml_operator, role: 'operator') }
  let(:test_operator) { create(:aml_operator, role: 'operator') }

  context 'администратор может' do
    before { login_user administrator }

    it '#create создавать операторов' do
      post :create, params: { operator: test_operator.attributes }
      expect(response.status).to eq(200)
    end

    it '#update редактировать операторов' do
      put :update, params: { id: test_operator.id, operator: { email: 'new@mail.com' } }
      expect(response.status).to eq(200)
    end
  end

  context 'оператор' do
    before { login_user operator }

    it '#update не может редактировать другого оператора' do
      put :update, params: { id: test_operator.id, operator: { email: 'new@mail.com' } }
      expect(response).to be_forbidden
    end

    it '#update может редактировать свой профиль' do
      put :update, params: { id: operator.id, operator: { email: 'new@mail.com' } }
      expect(response.status).to eq(200)
    end
  end
end
