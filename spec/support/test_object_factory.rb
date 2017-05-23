require 'rspec-rails'

class TestObjectFactory
  class << self
    def new_connection
      FakeConnection.new
    end

    def new_message(opts = {})
      Message.new(opts)
    end

    def create_message(opts = {})
      new_message(opts).tap(&:save!)
    end

    def new_user(opts = {})
      random_number = rand(10000).to_s
      defaults = {
          username: 'person' + random_number,
          password: 'fakepassword',
          password_confirmation: 'fakepassword'
      }
      User.new(defaults.merge(opts))
    end

    def create_user(opts = {})
      new_user(opts).tap(&:save!)
    end
  end

  class FakeConnection
    def identifiers
      []
    end
  end
end


