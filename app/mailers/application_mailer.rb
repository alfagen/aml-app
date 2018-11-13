# frozen_string_literal: true

require 'custom_action_mailer'

class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailer.from

  self.delivery_method = :sendgrid_actionmailer
  self.sendgrid_actionmailer_settings = {
    api_key: Secrets.sendgrid_api_key,
    raise_delivery_errors: true
  }

  layout 'mailer'

  # советуют ловить только ActiveJob::DeserializationError
  # но мне интересно что там вообще может падать
  rescue_from StandardError do |exception|
    Rails.logger.error exception
    Bugsnag.notify exception
    raise exception
  end
end
