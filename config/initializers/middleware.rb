config = Rails.application.config

config.middleware.use Rack::RequestId
