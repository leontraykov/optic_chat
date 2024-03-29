# language: ru

Функционал: Регистрация пользователя

  Сценарий: Успешная регистрация нового пользователя
    Допустим я на странице регистрации
    Когда я заполняю форму регистрации корректными данными
    И я отправляю форму регистрации
    То я должен быть успешно зарегистрирован

  Сценарий: Регистрация с недостающей информацией
    Допустим я на странице регистрации
    Когда я заполняю форму регистрации с недостающей информацией
    И я отправляю форму регистрации
    То я должен увидеть сообщение об ошибке
