require 'rails_helper'

describe 'Chats API' do
  describe 'GET /chats' do
    it 'returns a successful response with ordered messages' do
      second_message = Message.create(text: 'You like baileys?', created_at: Time.now)
      first_message = Message.create(text: 'I got all the things ya need', created_at: 1.minute.ago)

      get '/'

      expect(response.status).to eq 200
      expect(assigns(:messages)).to eq([first_message, second_message])
    end
  end
end

