require 'rails_helper'

describe MessageBroadcastJob, type: :job do
  include ActiveJob::TestHelper

  describe '.perform_later/ .perform' do

    it 'queues the job' do
      message = TestObjectFactory.create_message
      #creating after commit calls the job so we have to clear queue
      clear_enqueued_jobs

      expect {MessageBroadcastJob.perform_later(message)}
          .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is in default queue' do
      expect(MessageBroadcastJob.new.queue_name).to eq('default')
    end

    it 'executes perform' do
      server_double = double('server thingy', broadcast: nil)
      renderer_double = double('renderer what a great name', render: 'some thing that render returns')
      allow(ActionCable).to receive(:server).and_return(server_double)
      allow(ApplicationController).to receive(:renderer).and_return(renderer_double)
      some_message = TestObjectFactory.create_message

      perform_enqueued_jobs do
        MessageBroadcastJob.perform_later(some_message)
      end

      expect(server_double).to have_received(:broadcast).with(
          'room_channel',
          message: 'some thing that render returns'
      )
      expect(renderer_double).to have_received(:render).with(
          partial: 'messages/message',
          locals: {message: some_message}
      )
    end
  end
end
