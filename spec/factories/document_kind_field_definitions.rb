FactoryBot.define do
  factory(:document_kind_field_definition, class: Aml::DocumentKindFieldDefinition) do
    key 'key'
    sequence(:title) { |n| "title#{n}" }
    document_kind
  end
end
