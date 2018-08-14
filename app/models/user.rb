require 'valid_email'

class User < ApplicationRecord
  extend Enumerize
  include Workflow

  authenticates_with_sorcery!

  after_commit :deliver_reset_password_instructions!, on: :create

  enumerize :workflow_state, in: %w[blocked unblocked], scope: true

  scope :ordered, -> { order 'id desc' }

  validates :password, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true, email: true

  workflow do
    state :unblocked do
      event :block, transitions_to: :blocked
    end

    state :blocked do
      event :unblock, transitions_to: :unblocked
    end
  end

  def active_for_authentication?
    unblocked?
  end
end
