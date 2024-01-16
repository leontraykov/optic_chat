# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room

  def create
    @message = current_user.messages.create(content: message_params[:content], chat_room_id: params[:chat_room_id])

    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @chat_room }
      end
    else
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('message_id', partial: 'messages/form', locals: { message: @message })
      end
      format.html { render 'chat_rooms/show' }
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
