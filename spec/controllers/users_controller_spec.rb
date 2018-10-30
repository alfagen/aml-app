require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:aml_operator) { create(:aml_operator, :administrator) }
  let(:administrator) { create(:user, aml_operator: aml_operator) }
  let!(:test_operator) { create(:aml_operator, role: 'operator') }
  let(:user) { create(:user, aml_operator: test_operator) }

  it '#create администратор может создавать пользователей' do
    login_user administrator
    post :create, params: { user: { email: 'new@mail.com', password: 'password', password_confirmation: 'password' } }
    expect(response.status).to eq(302)
  end

  it '#update администратор может может редактировать других пользователей' do
    login_user administrator
    put :update, params: { user: { email: 'new@mail.com', password: 'password', password_confirmation: 'password' }, id: user.id }
    expect(response.status).to eq(200)
  end

  it '#update оператор может редактировать себя' do
    login_user user
    put :update, params: { user: { email: 'newnew@mail.com', password: 'password', password_confirmation: 'password' }, id: user.id }
    expect(response.status).to eq(200)
  end
end
