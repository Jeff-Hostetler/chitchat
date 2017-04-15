require 'rails_helper'

describe Message do
  describe 'after the commit' do
    it 'calls to broadcast' do
      allow(MessageBroadcastJob).to receive(:perform_later)
      new_message = TestObjectFactory.create_message

      expect(MessageBroadcastJob).to have_received(:perform_later).with(new_message)
    end
  end
end