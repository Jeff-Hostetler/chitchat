class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def speak(data)
    Message.create!(text: data['text'])
  end
end