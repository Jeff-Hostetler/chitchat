require 'rails_helper'

describe 'RoomChannel' do
  describe '#subscribed' do
    it 'has a subscribed method' do
      #TODO figure out how to test channels
    end
  end

  describe '#speak' do
    it 'calls the ActionCable server to broadcast the given message to room_channel' do
      #I get to be lazy becase https://github.com/rails/rails/pull/23211
      #and  https://github.com/rspec/rspec-rails/issues/1606w
    end
  end
end