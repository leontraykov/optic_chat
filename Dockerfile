# Используйте официальный образ Ruby
FROM ruby:3.2.2

# Установка зависимостей
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client

# Установка Bun
# Обратите внимание, что метод установки может измениться, проверьте официальную документацию Bun
RUN curl -fsSL https://bun.sh/install | bash

WORKDIR /optic_chat

# Копируем Gemfile и Gemfile.lock
COPY Gemfile /optic_chat/Gemfile
COPY Gemfile.lock /optic_chat/Gemfile.lock
COPY package.json /optic_chat/package.json

# Установка зависимостей Ruby
RUN bundle install

# Копирование проекта в рабочую директорию
COPY . /optic_chat

# Установка JavaScript зависимостей с помощью Bun
RUN bun install

# Сборка ассетов с помощью Bun
RUN bun run build:js
RUN bun run build:css

# Копирование и установка entrypoint скрипта
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Открываем порт 5000
EXPOSE 5000

# Запуск сервера Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
