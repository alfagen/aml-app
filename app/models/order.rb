class Order < ApplicationRecord
  extend Enumerize
  include Workflow

  enumerize :workflow_state, in: %w[none pending processing accepted rejected], scope: true

  scope :ordered, -> { order 'id desc' }

  belongs_to :client
  has_many :client_documents, dependent: :destroy

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :patronymic, presence: true
  validates :birth_date, presence: true

  workflow do
    state :none do
      event :load, transitions_to: :pending
    end

    state :pending do
      event :process, transitions_to: :processing
    end

    state :processing do
      event :accept, transitions_to: :accepted
      event :reject, transitions_to: :rejected
    end

    state :accepted do
      event :reject, transitions_to: :rejected
    end

    state :rejected do
      event :accept, transitions_to: :accepted
    end
  end
end
