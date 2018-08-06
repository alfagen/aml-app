source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
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
gem 'virtus'
gem 'mini_magick', '~> 4.8'

gem 'settingslogic'
gem 'non-stupid-digest-assets'

gem 'workflow'

gem 'nprogress-rails'
gem 'ionicons-rails'
gem 'slim'
gem 'slim-rails'
gem 'authority'
gem 'sorcery', github: 'alfagen/sorcery'
gem 'semver2'
gem 'active_link_to', github: 'BrandyMint/active_link_to'
gem 'simple-navigation', '~> 3.13.0' # git: 'git://github.com/andi/simple-navigation.git'
gem 'simple-navigation-bootstrap'
gem 'bugsnag'
gem 'bootstrap-sass', '~> 3.2'
gem 'breadcrumbs_on_rails'
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'

source 'https://rails-assets.org' do
  # На случай есил в rail-assets снова отвалится https используем опасный вариант
  # source 'http://insecure.rails-assets.org' do
  gem 'rails-assets-noty'
end

gem 'rack-request-id'
gem 'rack-utf8_sanitizer'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'bootstrap-kaminari-views'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'semver'
end

group :development do
  gem 'scss-lint'

  gem 'capistrano', require: false
  gem 'capistrano-upload-config', require: false
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-shell', require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-secrets-yml', require: false
  gem 'capistrano-maintenance', require: false
  gem 'bugsnag-capistrano', require: false
  gem 'capistrano-faster-assets', require: false
  gem 'capistrano-semver-git-tags', require: false
  gem 'capistrano-git-with-submodules', '~> 2.0'
  gem 'capistrano-tasks', github: 'alfagen/capistrano-tasks', require: false
  gem 'capistrano-rails-console', require: false

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard'
  gem 'terminal-notifier-guard' #, '~> 1.6.1', require: darwin_only('terminal-notifier-guard')
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-ctags-bundler'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
