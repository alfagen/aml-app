class ChangePasswordForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include ActiveModel::Validations

  attribute :user_id, Integer
  attr_accessor :current_password

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

  def user
    @user ||= AML::Operator.find_by id: user_id
  end
end
