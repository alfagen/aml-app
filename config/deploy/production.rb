# frozen_string_literal: true

set :stage, :production
set :application, 'aml.kassa.cc'
set :rails_env, :production
set :user, 'kassa'
fetch(:default_env)[:rails_env] = :production

set :bundle_without, %w[test development].join(' ')
set :keep_releases, 2

server ENV['PRODUCTION_IP'], user: fetch(:user), roles: %w[web app db bugsnag].freeze
