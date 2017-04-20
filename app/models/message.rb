class Message < ApplicationRecord

  after_create_commit :broadcast

  def self.for_chatroom
    where('created_at > ?', 10.minutes.ago).order(:created_at)
  end

  private

  def broadcast
    MessageBroadcastJob.perform_later(self)
  end

end