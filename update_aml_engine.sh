#/usr/bin/env sh

CURRENT_VERSION=`ruby -r./vendor/aml-engine/lib/aml/version -e "print AML::VERSION"`

cd ./vendor/aml-engine
git checkout master && git pull > /dev/null
# make all
cd ../../
pwd

bundle
git add Gemfile.lock
rails aml:install:migrations

NEW_VERSION=`ruby -r./vendor/aml-engine/lib/aml/version -e "print AML::VERSION"`

if [ "${CURRENT_VERSION}" = "${NEW_VERSION}" ]; then
  echo "Обновление прекращено: Версия не изменилась (${CURRENT_VERSION})"
  exit 1
fi

MESSAGE="update aml-engine from ${CURRENT_VERSION} to ${NEW_VERSION}"

echo "Создаю и заливаю комит '${MESSAGE}'"
git add ./db/
git add ./vendor/aml-engine
git commit -m "${MESSAGE}"
git push

echo 'Можно релизить'
