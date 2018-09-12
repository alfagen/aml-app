FactoryBot.define do
  factory(:document_kind, class: AML::DocumentKind) do
    sequence(:title) { |n| "title#{n}" }
    details 'Details'
    position 1
    document_group
  end
end
