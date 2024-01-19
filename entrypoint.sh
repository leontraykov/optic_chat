#!/bin/bash
set -e

yarn install

yarn build
yarn build:css

if [ "$1" == "tests" ]; then
  echo "Running Cucumber tests..."
  bundle exec cucumber

  echo "Running RSpec tests..."
  bundle exec rspec -f d

  exit 0
fi

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ ! -f /opt/app-initialized/initialized ]; then
  while ! pg_isready -h db -p 5432 -U user; do
    sleep 2
  done

  touch /opt/app-initialized/initialized
  bundle exec rake db:drop db:create db:migrate

  echo "Seeding the database..."
  bundle exec rake db:seed
  echo "Database seeding completed."
fi

exec "$@"
