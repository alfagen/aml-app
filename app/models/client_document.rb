# frozen_string_literal: true

class ClientDocument < ApplicationRecord
  extend Enumerize
  include Workflow
  mount_uploader :file, FileUploader

  enumerize :workflow_state, in: %w[pending accepted rejected], scope: true

  scope :ordered, -> { order 'id desc' }

  belongs_to :document_kind
  belongs_to :order

  validates :file, presence: true
  validates :document_kind_id, uniqueness: { scope: :client_id }

  delegate :first_name, to: :order
  delegate :surname, to: :order
  delegate :patronymic, to: :order
  delegate :title, to: :document_kind

  workflow do
    state :pending do
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

  def name
    "Имя: #{first_name} Фамилия: #{surname} Отчество:#{patronymic}"
  end
end
