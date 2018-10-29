require 'rails_helper'

RSpec.describe Amlapp::OperatorsController, type: :controller do
  let!(:aml_operator) { create(:aml_operator, :administrator) }
  let(:user) { create(:user, aml_operator_id: aml_operator.id) }
  let(:test_operator) { create(:aml_operator, role: 'operator') }

  context 'администратор может' do
    before { login_user user }

    it '#create создавать операторов' do
      post :create, params: { operator: test_operator.attributes }
      expect(response.status).to eq(200)
    end

    it '#update редактировать операторов' do
      put :update, params: { id: test_operator.id, operator: { email: 'new@mail.com' } }
      expect(response.status).to eq(200)
    end
  end
end
