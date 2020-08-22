class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(name: :soporte)
    @message = Message.new
  end
end
