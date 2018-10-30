class User < ApplicationRecord
  authenticates_with_sorcery!

  scope :ordered, -> { order 'id desc' }

  belongs_to :aml_operator, class_name: 'AML::Operator', foreign_key: :aml_operator_id, inverse_of: :user, dependent: :destroy

  validates :password, length: { minimum: 8 }, on: :update, if: :crypted_password_changed?
  validates :password, confirmation: true, on: :update, if: :crypted_password_changed?
  validates :password_confirmation, presence: true, on: :update, if: :crypted_password_changed?
  validates :email, presence: true, uniqueness: true, email: true

  after_commit :deliver_reset_password_instructions!, on: :create, if: -> { respond_to?(:deliver_reset_password_instructions!) }

  def active_for_authentication?
    aml_operator.unblocked?
  end

  # TODO move to sorcery
  #
  def change_password!(new_password)
    clear_reset_password_token
    self.password_confirmation = new_password
    self.password = new_password
    save!
  end
end
