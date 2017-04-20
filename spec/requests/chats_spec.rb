require 'rails_helper'

describe 'Chats API' do
  describe 'GET /chats' do
    it 'returns a successful response with ordered messages that have been created in the last 10 minutes' do
      TestObjectFactory.create_message(created_at: 11.minutes.ago)
      second_message = TestObjectFactory.create_message(created_at: Time.now)
      first_message = TestObjectFactory.create_message(created_at: 9.minutes.ago)

      get '/'

      expect(response.status).to eq 200
      expect(assigns(:messages)).to eq([first_message, second_message])
    end
  end
end

