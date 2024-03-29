# language: ru

Функционал: Создание чат-комнаты пользователем

  Сценарий: Успешное создание новой чат-комнаты
    Допустим я авторизован как пользователь
    И я на странице создания новой чат-комнаты
    Когда я ввожу название чат-комнаты
    И нажимаю кнопку создания чат-комнаты
    То я вижу созданную чат-комнату с указанным названием

  Сценарий: Создание чат-комнаты без указания названия
    Допустим я авторизован как пользователь
    И я на странице создания новой чат-комнаты
    Когда я не ввожу название чат-комнаты
    И нажимаю кнопку создания чат-комнаты
    То я вижу страницу чат-комнаты с автоматически сгенерированным названием
