FactoryBot.define do
  factory(:document_kind, class: Aml::DocumentKind) do
    sequence(:title) { |n| "title#{n}" }
  end
end
