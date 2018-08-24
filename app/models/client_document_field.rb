class ClientDocumentField < ApplicationRecord
  scope :ordered, -> { order 'id desc' }

  belongs_to :client_document
  belongs_to :document_kind_field_definition

  validates :document_kind_field_definition_id, uniqueness: { scope: :client_document_id}
  validates :value, presence: true

  delegate :title, to: :definition
end
