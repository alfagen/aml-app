require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, :operator) }
  let(:password) { generate :aml_password }

  before do
    user.change_password! password
  end

  it { expect(user.valid_password? password) }
end
