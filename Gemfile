source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'mysql2', '~> 0.5.2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'carrierwave'
gem 'mini_magick', '~> 4.8'
gem 'ransack'
gem 'virtus'

gem 'draper', '~> 3.0.1' # , github: 'drapergem/draper'

gem 'globalize', github: 'globalize/globalize', ref: 'HEAD'
gem 'globalize-accessors'
gem 'http_accept_language'
gem 'localized_render'

gem 'non-stupid-digest-assets'
gem 'settingslogic'

gem 'workflow', github: 'geekq/workflow'

# Можно перейти в master если туда влили этот PR https://github.com/Netflix/fast_jsonapi/pull/230
# Данные изменения отлавливаются в spec/serializers/order_serializer_spec.rb
gem 'fast_jsonapi', github: 'HoJSim/fast_jsonapi', branch: 'dev'

gem 'aml', path: 'vendor/aml-engine'

gem 'active_link_to', github: 'BrandyMint/active_link_to'
gem 'authority'
gem 'bootstrap-sass', '~> 3.2'
gem 'breadcrumbs_on_rails'
gem 'bugsnag'
gem 'enumerize'
gem 'ionicons-rails'
gem 'semver2'
gem 'simple-navigation', '~> 3.13.0' # git: 'git://github.com/andi/simple-navigation.git'
gem 'simple-navigation-bootstrap'
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'
gem 'slim'
gem 'slim-rails'
gem 'sorcery', github: 'alfagen/sorcery'
gem 'valid_email'

source 'https://rails-assets.org' do
  # На случай есил в rail-assets снова отвалится https используем опасный вариант
  # source 'http://insecure.rails-assets.org' do
  gem 'rails-assets-noty'
end

gem 'bootstrap-kaminari-views'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'mailgun-ruby'
gem 'momentjs-rails', '>= 2.9.0'
gem 'nprogress-rails'
gem 'rack-request-id'
gem 'rack-utf8_sanitizer'
gem 'rails-i18n'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry'
  gem 'pry-doc'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Добавляет show-routes и show-models
  # и делает рельсовую конслоль через pry
  gem 'pry-rails'

  # show-method
  # hist --grep foo
  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'pry-byebug'

  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.7'
  gem 'semver'

  gem 'factory_bot'
  gem 'factory_bot_rails'
end

group :development do
  gem 'overcommit'
  gem 'rubocop'

  gem 'scss-lint'

  gem 'letter_opener'
  gem 'letter_opener_web'

  gem 'bugsnag-capistrano', require: false
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-faster-assets', require: false
  gem 'capistrano-git-with-submodules', '~> 2.0'
  gem 'capistrano-maintenance', require: false
  gem 'capistrano-master-key', github: 'virgoproz/capistrano-master-key', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-secrets-yml', require: false
  gem 'capistrano-semver-git-tags', require: false
  gem 'capistrano-shell', require: false
  gem 'capistrano-tasks', github: 'alfagen/capistrano-tasks', require: false
  gem 'capistrano-upload-config', require: false
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma', require: false

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard'
  gem 'terminal-notifier-guard' # , '~> 1.6.1', require: darwin_only('terminal-notifier-guard')

  gem 'guard-bundler'
  gem 'guard-ctags-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'database_rewinder'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
