# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  # класс для управления поведение чат-комнаты
  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.all
    @users = User.without_me(current_user)
    @user = current_user
  end

  def new
    @chat_room = ChatRoom.new
    @users = User.without_me(current_user)
  end

  def create
    User.all
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      @chat_room.users << current_user
      redirect_to @chat_room, notice: 'Done. Freedom of speech!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = ChatRoom.new
    @exact_room = ChatRoom.find(params[:id])
    @rooms = ChatRoom.all

    @message = Message.new
    @messages = @exact_room.messages.order(created_at: :asc)

    @current_user = current_user
    @users = User.without_me(@current_user)

    # render "index"
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name, user_ids: [])
  end
end
