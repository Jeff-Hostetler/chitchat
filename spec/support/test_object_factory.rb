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
  end

  class FakeConnection
    def identifiers
      []
    end
  end
end


