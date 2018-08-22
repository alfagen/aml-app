FactoryBot.define do
  factory :document_kind do
    sequence(:title) { |n| "title#{n}" }
  end
end
