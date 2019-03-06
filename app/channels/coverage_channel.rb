class CoverageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "coverage_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
