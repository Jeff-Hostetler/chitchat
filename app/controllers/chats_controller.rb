class ChatsController < ApplicationController
  def index
    @messages = Message.for_chatroom
  end
end