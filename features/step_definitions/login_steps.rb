Given('a user with email {string} and a password of {string}') do |email, password|
  User.create!(email: "test@example.com", password: "secret", password_confirmation: "secret")
end

When('I go to the log in page') do
  visit new_user_session_path
end

And('I fill in "user_email" with {string}') do |email|
  fill_in 'user_email', with: email
end

And('I fill in "user_password" with {string}') do |password|
  fill_in 'user_password', with: password
end

And('I am not logged in') do
  # Убедиться, что пользователь не авторизован. 
  # Это может быть пустым, если сессии не сохраняются между тестами.
end

And('I press {string}') do |button_name|
  click_button button_name
end

Then('I should see {string}') do |expected_text|
  expect(page).to have_text(expected_text)
end