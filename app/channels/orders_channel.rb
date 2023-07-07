class OrdersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "orders_channel"
  end

  def unsubscribed
    raise NotImplementedError
  end
end
