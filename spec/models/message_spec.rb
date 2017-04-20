require 'rails_helper'

describe Message do
  describe 'after the commit' do
    it 'calls to broadcast' do
      allow(MessageBroadcastJob).to receive(:perform_later)
      new_message = TestObjectFactory.create_message

      expect(MessageBroadcastJob).to have_received(:perform_later).with(new_message)
    end
  end

  describe '.for_chatroom' do
    before do
      @second_message = TestObjectFactory.create_message(created_at: Time.now)
      @first_message = TestObjectFactory.create_message(created_at: 9.minutes.ago)
    end
    it 'orders messages by created_at' do
      expect(Message.for_chatroom).to eq([@first_message, @second_message])
    end

    it 'only returns messages created in the last 10 minutes' do
      @first_message.update_attributes!(created_at: 11.minutes.ago)

      expect(Message.for_chatroom).to eq([@second_message])
    end
  end
end