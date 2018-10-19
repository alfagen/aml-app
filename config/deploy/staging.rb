# frozen_string_literal: true

set :stage, :staging
set :application, 'aml.staging'
set :rails_env, :staging
fetch(:default_env)[:rails_env] = :staging

set :linked_files, %w[config/database.yml config/secrets.yml]

set :bundle_without, %w[test].join(' ')
set :keep_releases, 2

# http://aml.kassa.stage.bang8.ru
server 'stage.bang8.ru', user: fetch(:user), roles: %w[web app db bugsnag].freeze
