require 'rails_helper'

describe User do
  describe 'validations' do
    it 'requires username to be unique' do
      TestObjectFactory.create_user(username: 'jeff')

      new_user = TestObjectFactory.new_user(username: 'jeff')

      expect(new_user.valid?).to be_falsey
      expect(new_user.errors.full_messages).to eq(['Username has already been taken'])
    end
  end
end