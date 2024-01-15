#!/bin/bash
set -e

# Проверка на запуск тестов
if [ "$1" == "tests" ]; then
  echo "Running RSpec tests..."
  bundle exec rspec -f d

  echo "Running Cucumber tests..."
  bundle exec cucumber

  exit 0
fi

# Удаление существующего PID файла сервера
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
