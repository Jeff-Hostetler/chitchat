require 'rails_helper'

describe PagesController do
  describe 'GET /' do
    it 'returns a successful response' do
      get :index

      expect(response.status).to eq 200
    end
  end
end

