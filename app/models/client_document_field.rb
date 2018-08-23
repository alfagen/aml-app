class ClientDocumentField < ApplicationRecord
  scope :ordered, -> { order 'id desc' }

  belongs_to :client_document
  belongs_to :document_kind_field_definition

  validates :value, presence: true
end
