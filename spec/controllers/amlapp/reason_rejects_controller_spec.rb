require 'rails_helper'

RSpec.describe Amlapp::RejectReasonsController, type: :controller do
  let(:administrator) { create(:aml_operator, :administrator) }
  let(:aml_reason) { create(:aml_reject_reason) }

  before { login_user(administrator) }

  it '#create' do
    post :create, params: { aml_reason: attributes_for(:aml_reject_reason) }
    expect(response).to be_successful
  end

  it '#index' do
    get :index
    expect(response).to be_successful
  end

  it '#update' do
    put 'update', params: { id: aml_reason.id, title: 'another title' }
    expect(response).to be_redirect
  end

  it '#delete' do
    delete :destroy, params: { id: aml_reason.id }
    expect(response).to be_redirect
  end
end
