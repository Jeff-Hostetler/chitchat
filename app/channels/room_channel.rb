class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def speak(data)
    ActionCable.server.broadcast "room_channel", text: data['text']
  end
end