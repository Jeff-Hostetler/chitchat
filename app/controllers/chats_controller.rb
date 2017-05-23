class ChatsController < ApplicationController
  def main
    @messages = Message.for_chatroom
  end
end