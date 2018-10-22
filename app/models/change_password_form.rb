class ChangePasswordForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include ActiveModel::Validations

  attribute :current_password, String
  attribute :password, String
  attribute :password_confirmation, String
  attribute :locale, String
  attribute :user

  validates :password, presence: true
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true

  validate :validate_current_password, if: :current_password_required?
  validates :current_password, presence: true, if: :current_password_required?

  private

  def validate_current_password
    return if user.valid_password? current_password

    errors.add :current_password, 'Текущий пароль не верен.'
  end

  def current_password_required?
    user.crypted_password? && user.crypted_password_was.present? && user.persisted?
  end
end
