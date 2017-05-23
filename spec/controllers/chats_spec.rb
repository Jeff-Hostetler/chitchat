require 'rails_helper'

describe ChatsController do
  describe 'GET /chats/main' do
    context 'user is signed in' do
      it 'returns a successful response with ordered messages that have been created in the last 10 minutes' do
        user = TestObjectFactory.create_user
        second_message = TestObjectFactory.create_message(created_at: Time.now)
        first_message = TestObjectFactory.create_message(created_at: 9.minutes.ago)

        get :main, session: {user_id: user.id}

        expect(response.status).to eq 200
        expect(assigns(:messages)).to eq([first_message, second_message])
      end
    end

    context 'user not signed in' do
      it 'redirects to root' do
        get :main

        expect(response.status).to eq 302
        expect(response).to redirect_to('/signin')
      end
    end
  end
end

