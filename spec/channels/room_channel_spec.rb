require 'rails_helper'

describe 'RoomChannel' do
  describe '#subscribed' do
    it 'has a subscribed method' do
      #TODO figure out how to test channels
    end
  end

  describe '#speak' do
    it 'calls the ActionCable server to broadcast the given message to room_channel' do
      server_stub = double("action cable server", :broadcast)
      allow(ActionCable).to receive(:server).and_return(server_stub)

      #TODO figure out how to test channels
      #how to I initialized the room channel w/ connection and all that?
      #test that server_stub got called with correct args
    end
  end
end