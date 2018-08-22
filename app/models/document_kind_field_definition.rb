class DocumentKindFieldDefinition < ApplicationRecord
  extend Enumerize
  include Authority::Abilities
  include Workflow

  enumerize :workflow_state, in: %w[actived archived], scope: true

  scope :ordered, -> { order 'id desc' }

  belongs_to :document_kind

  validates :title, presence: true
  validates :key, presence: true, format: { with: /[a-z_]+/, on: :create }, uniqueness: { scope: :document_kind }

  workflow do
    state :actived do
      event :archive, transitions_to: :archived
    end

    state :archived do
      event :active, transitions_to: :actived
    end
  end
end
