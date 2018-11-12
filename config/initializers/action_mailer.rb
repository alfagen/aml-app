Rails.application.configure do
  if Rails.env.test?
    config.action_mailer.delivery_method = :test
  else
    config.action_mailer.delivery_method = :sendgrid_actionmailer
    config.action_mailer.sendgrid_actionmailer_settings = {
      api_key: Secrets.sendgrid_api_key,
      raise_delivery_errors: true
    }
  end

  # NOTE не хочет подтягивать конфиг из initializers/mailgun.rb
  # config.action_mailer.mailgun_settings = {
  # api_key: Secrets.mailgun_api_key,
  # domain: Secrets.mailgun_domain
  # }
end
