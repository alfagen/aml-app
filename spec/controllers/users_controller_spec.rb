require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  before { login_user user }

  it '#update оператор может редактировать свой профиль' do
    put :update, params: { operator: { email: 'new@mail.com', time_zone: '' } }
    expect(response.status).to eq(200)
  end
end
