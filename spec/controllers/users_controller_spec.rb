require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:operator) { create :aml_operator, :administrator }
  let(:user) { DummyUser.new(aml_operator: operator) }

  before { allow(controller).to receive(:current_user).and_return user }

  it '#update оператор может редактировать свой профиль' do
    put :update, params: { user: { email: 'new@mail.com' } }
    expect(response.status).to eq(200)
  end
end
