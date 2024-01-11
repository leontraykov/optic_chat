#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ ! -f /opt/app-initialized/initialized ]; then
  while ! pg_isready -h db -p 5432 -U user; do
    sleep 2
  done

  touch /opt/app-initialized/initialized
fi

bundle exec rake db:drop db:create db:migrate 

echo "Creating users..."
bundle exec rake db:seed
echo "Users created."

echo "Running RSpec tests..."
bundle exec rspec

echo "Running Cucmber tests..."
bundle exec cucumber

exec "$@"