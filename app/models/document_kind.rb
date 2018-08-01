class DocumentKind < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :client_documents, dependent: :destroy
end
