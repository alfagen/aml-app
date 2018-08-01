class DocumentKind < ApplicationRecord
  scope :ordered, -> { order 'id desc' }

  has_many :client_documents, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
