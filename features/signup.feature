# language: ru

Функционал: Регистрация пользователя в системе

  Сценарий: Успешная регистрация
    Допустим я на странице регистрации
    Когда я ввожу в поле "user_email" значение "newuser@example.com"
    И я ввожу в поле "user_password" значение "newpassword"
    И я ввожу в поле "user_password_confirmation" значение "newpassword"
    И я нажимаю на кнопку "Sign up"
    То я должен увидеть "Welcome! You have signed up successfully."
