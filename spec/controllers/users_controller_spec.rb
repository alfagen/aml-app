require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:aml_operator) }
  before { login_user user }

  it '#update оператор может редактировать свой профиль' do
    put :update, params: { user: { email: 'new@mail.com' } }
    expect(response.status).to eq(200)
  end
end
