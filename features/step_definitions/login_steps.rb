# frozen_string_literal: true

Допустим('пользователь с электронной почтой {string} и паролем {string}') do |email, password|
  User.create!(email:, password:, password_confirmation: password)
end

Когда('я перехожу на страницу входа') do
  visit new_user_session_path
end

И('я ввожу в поле "user_email" значение {string}') do |email|
  fill_in 'user_email', with: email
end

И('я ввожу в поле "user_password" значение {string}') do |password|
  fill_in 'user_password', with: password
end

И('я не авторизован') do
  # Убедиться, что пользователь не авторизован.
  # Это может быть пустым, если сессии не сохраняются между тестами.
end

И('я нажимаю на кнопку {string}') do |button_name|
  click_button button_name
end

То('я должен увидеть {string}') do |expected_text|
  expect(page).to have_text(expected_text)
end
