require 'rails_helper'

RSpec.describe Amlapp::ProfilesController, type: :controller do
  let!(:aml_operator) { create(:aml_operator) }
  let(:user) { create(:user, aml_operator_id: aml_operator.id) }
  before { login_user user }

  it '#update оператор может редактировать свой профиль' do
    put :update, params: { operator: { email: 'new@mail.com', time_zone: '' } }
    expect(response.status).to eq(200)
  end
end
