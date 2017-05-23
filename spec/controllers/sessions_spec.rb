require 'rails_helper'

describe SessionsController do
  describe 'GET /signin' do
    it 'returns a successful response' do
      get :new

      expect(response).to be_success
      expect(assigns(:user)).to be_present
    end

    it 'redirects if user is signed in' do
      user = TestObjectFactory.create_user

      get :new, session: {user_id: user.id}

      expect(response.status).to eq 302
      expect(response).to redirect_to('/chats/main')
    end
  end

  describe 'POST /signin' do
    before do
      @user = TestObjectFactory.create_user(
          username: 'test',
          password: 'fake',
          password_confirmation: 'fake',
      )
    end
    it 'logs in a user when correct credentials provided' do
      post :create, params: {session: {username: 'test', password: 'fake'}}

      expect(session[:user_id]).to eq @user.id
    end

    it 'does not log in with incorrect credentials' do
      post :create, params: {session: {username: 'test', password: 'wrong'}}

      expect(session[:user_id]).to be_nil
      expect(assigns(:login_error)).to eq('Incorrect username/password combo')
    end
  end
end

