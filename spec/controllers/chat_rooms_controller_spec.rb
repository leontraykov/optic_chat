# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  let(:user) { create(:user) } # Предполагается, что у вас есть factory для пользователя

  before do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @chat_rooms" do
      chat_room = create(:chat_room) # Предполагается, что у вас есть factory для chat_room
      get :index
      expect(assigns(:chat_rooms)).to eq([chat_room])
    end

    it "assigns @users" do
      other_user = create(:user)
      get :index
      expect(assigns(:users)).to include(other_user)
    end

    it "assigns @user" do
      get :index
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "responds successfully" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new ChatRoom to @chat_room" do
      get :new
      expect(assigns(:chat_room)).to be_a_new(ChatRoom)
    end

    it "assigns other users to @users excluding current_user" do
      other_users = create_list(:user, 3)
      get :new
      expect(assigns(:users)).to match_array(other_users)
      expect(assigns(:users)).not_to include(user)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) { { name: 'New Chat Room' } }

      it "creates a new chat room and redirects to the show page" do
        expect {
          post :create, params: { chat_room: valid_attributes }
        }.to change(ChatRoom, :count).by(1)
        expect(response).to redirect_to(ChatRoom.last)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { name: '' } }

      it "does not create a chat room and renders new template" do
        expect {
          post :create, params: { chat_room: invalid_attributes }
        }.not_to change(ChatRoom, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    let(:chat_room) { create(:chat_room) }

    context "when user is a member of the chat room" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, params: { id: chat_room.id }
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show, params: { id: chat_room.id }
        expect(response).to render_template(:show)
      end

      it "assigns the requested chat room to @chat_room" do
        get :show, params: { id: chat_room.id }
        expect(assigns(:exact_room)).to eq(chat_room)
      end
    end
  end
end
