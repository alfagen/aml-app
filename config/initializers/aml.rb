AML.configure do |config|
  config.allowed_emails = Secrets.aml_allowed_emails
  config.mail_from = Settings.mailer.from
  config.logger = ActiveSupport::Logger.new Rails.root.join './log/aml.log'
end

Rails.application.config.after_initialize do
  [
    AML::Order, AML::Client, AML::Operator, AML::OrderDocument,
    AML::DocumentKindFieldDefinition, AML::DocumentKind, AML::DocumentGroup, AML::DocumentField
  ].each { |model| model.include Authority::Abilities }

  AML::Operator.include Authority::UserAbilities
  AML::Operator.authenticates_with_sorcery!
end
