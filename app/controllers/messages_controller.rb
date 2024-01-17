# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room

  def create
    @message = current_user.messages.create(content: message_params[:content], chat_room_id: params[:chat_room_id])
  
    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to @chat_room }
      else
        @exact_room = ChatRoom.find(params[:chat_room_id])
        @messages = @exact_room.messages # Установка @messages здесь
        format.html { render 'chat_rooms/show', status: :unprocessable_entity }
      end
    end
  end   

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
