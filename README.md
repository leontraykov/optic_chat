[RU]
# ЧатЧат

Это приложение - чат, где пользователи могут создавать комнаты и обмениваться сообщениями в реальном времени. Проект разработан с использованием Ruby on Rails 7, Docker, PostgreSQL, Hotwire Turbo & Stimulus, Rspec, Devise и Bootstrap 5, а также протестирован с помощью Cucumber и RSpec.

## Функциональность

- Создание и вход в комнаты для общения.
- Обмен сообщениями в реальном времени.
- Автоматическое обновление списка пользователей, чат-комнат и сообщений при появлении новых.
- Очистка поля ввода после отправки сообщения.
- Полная поддержка тестирования с использованием Cucumber и RSpec.

## Установка и Запуск с Docker

Клонируйте репозиторий:

    git clone https://github.com/leontraykov/optic_chat.git <папка>
    cd <папка>

Запустите приложение с помощью Docker:

    docker compose up --build

Запустите тесты:

    docker compose run tests

Откройте приложение в браузере по адресу http://localhost:5000

[EN]
# ChatChat

This application is a chat platform where users can create rooms and exchange messages in real time. The project is developed using Ruby on Rails 7, Docker, PostgreSQL, Hotwire Turbo & Stimulus, Rspec, Devise, and Bootstrap 5, and it's thoroughly tested with Cucumber and RSpec.

## Features

- Creating and joining chat rooms for communication.
- Real-time message exchange.
- Automatic updates of user lists, chat rooms, and messages when new ones appear.
- Clearing the input field after sending a message.
- Comprehensive testing support with Cucumber and RSpec.

## Installation and Launch with Docker

Clone the repository:

    git clone https://github.com/leontraykov/optic_chat.git <folder>
    cd <folder>

Launch the application using Docker:

    docker compose up --build

Run the tests:

    docker compose run tests

Open the application in a browser at http://localhost:5000.
