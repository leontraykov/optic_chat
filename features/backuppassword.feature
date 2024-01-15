# language: ru

Функционал: Восстановление пароля пользователя

  Сценарий: Запрос на восстановление пароля
    Допустим пользователь с электронной почтой "user@example.com" зарегистрирован
    И я на странице восстановления пароля
    Когда я ввожу "user@example.com" в поле "Email"
    И я нажимаю на кнопку "Send me reset password instructions"
    То я должен увидеть "You will receive an email with instructions on how to reset your password in a few minutes."
