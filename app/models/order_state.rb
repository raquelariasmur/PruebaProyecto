class OrderState < ApplicationRecord
  validates :name, presence: true
  validates :time_in_minutes, presence: true
end
