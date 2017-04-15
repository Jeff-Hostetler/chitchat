class Message < ApplicationRecord

  after_create_commit :broadcast


  private

  def broadcast
    MessageBroadcastJob.perform_later(self)
  end

end