AML.configure do |config|
  config.allowed_emails = Secrets.aml_allowed_emails
  config.mail_from = Settings.mailer.from
  config.logger = ActiveSupport::Logger.new Rails.root.join './log/aml.log'
  config.logger.formatter = AutoLogger::Formatter.new
end
