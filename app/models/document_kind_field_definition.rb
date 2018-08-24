class DocumentKindFieldDefinition < ApplicationRecord
  include Authority::Abilities
  include Archivable

  scope :ordered, -> { order 'id desc' }

  belongs_to :document_kind
  has_many :client_document_fields

  validates :title, presence: true
  validates :key, presence: true, format: { with: /[a-z_]+/ }, uniqueness: { scope: :document_kind }
end
