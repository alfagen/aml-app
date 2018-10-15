class ChangePasswordForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include ActiveModel::Validations

  attribute :current_password, String
  attribute :password, String
  attribute :password_confirmation, String
end
