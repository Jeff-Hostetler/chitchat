require 'rails_helper'

describe 'Chats API' do
  describe 'GET /chats' do
    it 'returns a successful response with ordered messages' do
      second_message = TestObjectFactory.create_message({created_at: Time.now})
      first_message = TestObjectFactory.create_message({created_at: 1.minute.ago})

      get '/'

      expect(response.status).to eq 200
      expect(assigns(:messages)).to eq([first_message, second_message])
    end
  end
end

