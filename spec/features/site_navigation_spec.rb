# require 'rails_helper'

# RSpec.feature "Site Navigation", :type => :feature do
#   let(:user) { create(:user) }

#   scenario "Navigate to the homepage" do
#     # Вход в систему
#     visit new_user_session_path
#     fill_in 'Email', with: user.email
#     fill_in 'Пароль', with: user.password
#     click_button 'Войти'

#     visit root_path

#     expect(page).to have_text("Это ЧатЧат! Болтать разрешено!")
#   end

#   scenario "Navigate to a chat room" do
#     login_as(user)
#     chat_room = create(:chat_room)

#     visit chat_room_path(chat_room)

#     expect(page).to have_text(chat_room.name)
#   end
# end
