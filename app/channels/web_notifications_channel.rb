class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_for current_user
    stream_from "web_notifications"
  end
end
