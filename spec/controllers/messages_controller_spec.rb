# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:chat_room) { create(:chat_room) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new message and redirects' do
        post_params = {
          chat_room_id: chat_room.id,
          message: { content: 'Hello, world!' }
        }
        expect {
          post :create, params: post_params
        }.to change(Message, :count).by(1)
        expect(response).to redirect_to(chat_room_path(chat_room))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a message and re-renders chat_room show' do
        post_params = {
          chat_room_id: chat_room.id,
          message: { content: '' } # empty content is invalid
        }
        post :create, params: post_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
