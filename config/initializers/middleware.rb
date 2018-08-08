# frozen_string_literal: true

config = Rails.application.config

config.middleware.use Rack::RequestId
