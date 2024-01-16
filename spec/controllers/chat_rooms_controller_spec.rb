require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  let(:user) { create(:user) }
  let(:chat_room) { create(:chat_room) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'displays all chat rooms' do
      chat_room
      get :index
      expect(response.body).to include('Chat Rooms:')
    end

    it 'displays users' do
      other_user = create(:user)
      get :index
      expect(response.body).to include('Participants')
    end
  end

  describe 'GET #new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_successful
    end

    it 'displays a new chat room form' do
      get :new
      expect(response.body).to include('New Chat Room')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new chat room and redirects to the show page' do
        expect {
          post :create, params: { chat_room: { name: 'New Chat Room', user_ids: [] } }
        }.to change(ChatRoom, :count).by(1)
        expect(response).to redirect_to(ChatRoom.last)
      end
    end

    context 'with blank name' do
      it 'creates a new chat room with default name' do
        expect {
          post :create, params: { chat_room: { name: '', user_ids: [] } }
        }.to change(ChatRoom, :count).by(1)
  
        created_chat_room = ChatRoom.last
        expect(created_chat_room.name).to match(/Chat Room #\d+/)
        expect(response).to redirect_to(created_chat_room)
      end
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: chat_room.id }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
    it 'displays the requested chat room details' do
      expect(response.body).to include(chat_room.name)
    end
    
    it 'displays messages of the chat room ordered by created_at asc' do
      message = create(:message, chat_room: chat_room)
      get :show, params: { id: chat_room.id }
      expect(response.body).to include(message.content)
    end
  end
end
    

