class TimerStatusJob < ApplicationJob
  queue_as :default
  require 'timers'
  
  def perform(order)
    timers = Timers::Group.new
    time_in_minutes = order.order_state.time_in_minutes
    temp = 0
    cronometer = timers.every(time_in_minutes * 20) { 
      time_in_minutes = order.order_state.time_in_minutes
      case temp 
      when 0
        order.update_attribute(:order_state_id, 2)
        temp += 1
      when 1
        order.update_attribute(:order_state_id, 3)
        temp += 1
      else 
        return;
      end
    }
    loop { timers.wait }
  end
end
