class ClientDocumentField < ApplicationRecord
  scope :ordered, -> { order 'id desc' }

  belongs_to :client_document
  belongs_to :definition, class_name: 'DocumentKindFieldDefinition',
                          foreign_key: :document_kind_field_definition_id, inverse_of: :client_document_fields

  validates :document_kind_field_definition_id, uniqueness: { scope: :client_document_id }

  delegate :title, to: :definition
end