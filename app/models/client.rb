class Client < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :inn, presence: true, uniqueness: true
  has_many :client_documents, dependent: :destroy
end
