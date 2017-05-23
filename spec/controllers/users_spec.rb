require 'rails_helper'

describe UsersController do
  describe 'GET /users/new' do
    it 'allows visitor to visit signup page' do
      get :new

      expect(response).to be_success
      expect(assigns(:user)).to be_present
    end
  end

  describe 'POST /users' do
    it 'creates a user when valid user provided and redirects' do
      post :create, params: {user: {username: 'snicklefritz', password: 'pass123', password_confirmation: 'pass123'}}

      expect(response.status).to eq 302

      expect(response).to redirect_to('/chats/main')
      created_user = User.first
      expect(created_user.username).to eq 'snicklefritz'
    end

    it 'returns errors and stays on new w/ invalid user' do
      post :create, params: {user: {username: 'snicklefritz', password: 'pass123', password_confirmation: 'pass13'}}

      expect(response.status).to eq 200

      expect(assigns(:user)).to be_present
      expect(assigns(:user).errors).to match_array(['Password confirmation doesn\'t match Password'])
    end
  end
end

