# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Aml
  class Application < Rails::Application
    config.load_defaults 5.2

    I18n.default_locale = :ru

    # ru_RU, en_GB, cs_CZ
    # I18n.available_locales = [:ru, :en, :cs]
    config.time_zone = 'Europe/Moscow'
    Time.zone = 'Europe/Moscow'

    config.generators do |generate|
      generate.template_engine :slim
      generate.helper false
      generate.helper_specs false
      generate.javascript_engine false
      generate.request_specs true
      generate.stylesheets false
      generate.view_specs false
      generate.controller_spec true
    end
  end
end
