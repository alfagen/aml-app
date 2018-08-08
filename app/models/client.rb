# frozen_string_literal: true

class Client < ApplicationRecord
  extend Enumerize
  include Workflow

  enumerize :workflow_state, in: %w[unblocked blocked], scope: true

  scope :ordered, -> { order 'id desc' }

  has_many :client_documents, dependent: :destroy

  validates :name, presence: true
  validates :inn, presence: true, uniqueness: true

  workflow do
    state :unblocked do
      event :block, transitions_to: :blocked
    end

    state :blocked do
      event :unblock, transitions_to: :unblocked
    end
  end
end
