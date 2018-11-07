# Rails.application.config.after_initialize do
Rails.application.config.to_prepare do
  [
    AML::Order, AML::Client, AML::Operator, AML::OrderDocument, AML::Status, AML::RejectReason,
    AML::DocumentKindFieldDefinition, AML::DocumentKind, AML::DocumentGroup, AML::DocumentField,
    AML::CheckList, AML::OrderCheck
  ].each { |model| model.include Authority::Abilities }

  AML::Operator.include Authority::UserAbilities
end
