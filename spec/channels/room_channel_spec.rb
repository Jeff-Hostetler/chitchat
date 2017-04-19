require 'rails_helper'

describe 'RoomChannel' do
  describe '#subscribed' do
    it 'has a subscribed method' do
      #TODO figure out how to test channels
      #I get to be lazy becase https://github.com/rails/rails/pull/23211
      #and  https://github.com/rspec/rspec-rails/issues/1606w
    end
  end

  describe '#speak' do
    it 'creates a Message given data' do
      room_channel = RoomChannel.new(TestObjectFactory.new_connection, 'fake', {})
      room_channel.speak({'text' => 'hello there'})

      expect(Message.all.map(&:text)).to eq(['hello there'])
    end
  end
end