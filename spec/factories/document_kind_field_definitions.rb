FactoryBot.define do
  factory :document_kind_field_definition do
    key 'key'
    sequence(:title) { |n| "title#{n}" }
    document_kind
  end
end
