# frozen_string_literal: true

class Client < ApplicationRecord
  include Authority::Abilities

  scope :ordered, -> { order 'id desc' }

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :inn, presence: true, uniqueness: true
end
