# frozen_string_literal: true

set :stage, :staging
set :application, 'aml.staging'
set :rails_env, :staging
fetch(:default_env)[:rails_env] = :staging

set :bundle_without, %w[test].join(' ')
set :keep_releases, 2

# http://aml.stage.bang8.ru
server 'aml.stage.bang8.ru', port: '8122', user: fetch(:user), roles: %w[web app db bugsnag].freeze
