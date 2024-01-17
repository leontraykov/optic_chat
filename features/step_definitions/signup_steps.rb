# frozen_string_literal: true

Допустим('я на странице регистрации') do
  visit '/users/sign_up' # Настройте путь в соответствии с вашим приложением
end

Когда('я заполняю форму регистрации корректными данными') do
  fill_in 'Name', with: 'Иван Иванов'
  fill_in 'Email', with: 'ivan@example.com'
  fill_in 'Password', with: 'надежныйпароль'
  fill_in 'Confirm Password', with: 'надежныйпароль'
end

Когда('я заполняю форму регистрации с недостающей информацией') do
  fill_in 'Email', with: ''
  # Оставьте другие поля пустыми или заполните неверными данными
end

Когда('я отправляю форму регистрации') do
  click_button 'Register'
end

То('я должен быть успешно зарегистрирован') do
  expect(page).to have_content('Welcome')
end

То('я должен увидеть сообщение об ошибке') do
  expect(page).to have_content('error')
end
