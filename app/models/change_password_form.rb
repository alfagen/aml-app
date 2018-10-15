class ChangePasswordForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include ActiveModel::Validations

  attribute :password, String
  attribute :password_confirmation, String

  validates :password, presence: true
  validates :password, confirmation: true
end
