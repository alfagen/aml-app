class ClientDocument < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :document_kind
  belongs_to :client

  delegate :name, to: :client
  delegate :title, to: :document_kind

  include Workflow
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
end
