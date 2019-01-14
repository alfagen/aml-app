require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:operator) { create :aml_operator, :administrator }
  let(:user) { create :user, aml_operator: operator }

  before { login_user user }

  it '#update user может редактировать свой профиль' do
    put :update, params: { user: { email: 'new@mail.com' } }
    expect(response.status).to eq(200)
  end
end
