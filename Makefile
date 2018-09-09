all: setup tests eager_load

update_engines_migrations:
	rails aml:install:migrations

rails_env:
	bin/rails db:environment:set RAILS_ENV=test || echo 'Провалилось environment:set'
	# Примеры с parallel
	# rake parallel:rake[db:environment:set]
	# rake db:environment:set parallel:prepare
	env | grep PATH
	env | grep RAILS || (echo "!!! Установите RAILS_ENV=test" && /bin/false)

setup: selenium rails_env
	test -d public/uploads || mkdir public/uploads

tests:
	bundle exec rake db:drop || echo 'db does not exists'
	bundle exec rake db:create db:schema:load
	bundle exec rspec

parallel:
	bundle exec rake parallel:create parallel:load_structure parallel:spec

dump_test_seed: test_seed test_dump

test_seed:
	RAILS_ENV=test rake db:drop db:create db:schema:load RAILS_ENV=test

test_dump:
	mysqldump --skip-opt -n -t -p --skip-lock-tables --ignore-table=kassa_test.ar_internal_metadata --ignore-table=kassa_test.schema_migrations kassa_test > ./db/test.sql

eager_load:
	bin/rails runner Rails.application.eager_load! || echo 'Провалилось eager_load'
