lock '3.11.0'

set :application, 'aml'
set :user, 'www'

set :repo_url, 'git@github.com:alfagen/aml.git' if ENV['USE_LOCAL_REPO'].nil?
set :keep_releases, 10

set :skip_data_sync_confirm, true if ENV['SKIP_DATA_SYNC_CONFIRM']

set :linked_files, %w(config/database.yml)
set :linked_dirs, %w(log node_modules tmp/pids tmp/cache tmp/sockets public/system public/assets public/uploads)

set :config_files, fetch(:linked_files)

set :deploy_to, -> { "/home/#{fetch(:user)}/#{fetch(:application)}" }

ask :branch, ENV['BRANCH'] || proc { `git rev-parse --abbrev-ref HEAD`.chomp } || 'master'

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# https://gist.github.com/pitch-gist/2999707
# bundle exec cap production maintenance:enable REASON="замена сервера" UNTIL="в 2:00"
#
set :maintenance_template_path, File.expand_path('./maintenance.html.erb')
set :maintenance_dirname, -> { "#{current_path}/app" }

# настройка для capistrano-faster-assets которая указывает на файлы при изменеии которых (помимно самих ассетов) необходимо перекомпилировать ассеты
#
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb config/initializers/assets.rb)

set :assets_dir, %w(public/uploads)
set :local_assets_dir, 'public'

set :puma_init_active_record, true

set :bugsnag_api_key, Settings.bugsnag_api_key

set :db_local_clean, false

# Удаляем на дальнем сервере дамп базы после колнирования
set :db_remote_clean, true
