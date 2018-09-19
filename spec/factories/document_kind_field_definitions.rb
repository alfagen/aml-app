FactoryBot.define do
  factory(:document_kind_field_definition, class: AML::DocumentKindFieldDefinition) do
    key { 'key' }
    sequence(:title) { |n| "title#{n}" }
    position { 1 }
    document_kind
  end
end
