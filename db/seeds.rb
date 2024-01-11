# frozen_string_literal: true

users = User.create!([
  { name: 'abra', email: 'abra@ex.com', password: 'test_password_1', password_confirmation: 'test_password_1' },
  { name: 'cadabra', email: 'cadabra@ex.com', password: 'test_password_2', password_confirmation: 'test_password_2' },
  { name: 'salabim', email: 'salabim@ex.com', password: 'test_password_3', password_confirmation: 'test_password_3' }
])

chat_rooms = ChatRoom.create!([
  { name: 'White Magic' },
  { name: 'Black Magic' },
  { name: 'Apple pies baking' }
])

ChatRoomUser.create!([
  { chat_room: chat_rooms[0], user: users[0] },
  { chat_room: chat_rooms[0], user: users[1] },
  { chat_room: chat_rooms[1], user: users[1] },
  { chat_room: chat_rooms[1], user: users[2] },
  { chat_room: chat_rooms[2], user: users[0] },
  { chat_room: chat_rooms[2], user: users[1] },
  { chat_room: chat_rooms[2], user: users[2] }
])
