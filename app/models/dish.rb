class Dish < ApplicationRecord
  has_one_attached :photography

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :price, presence: true
  validates :state, inclusion: { in: [true, false] }
  validates :photography, presence: true

  scope :filter_on_search, ->(search, search_on_state) {
          if search.to_i.to_s == search
            where("name LIKE ? OR description LIKE ? OR price = ? OR state = ?",
                  "%#{search}%", "%#{search}%", search.to_i, search_on_state)
          else
            where("name LIKE ? OR description LIKE ? OR state = ?",
                  "%#{search}%", "%#{search}%", search_on_state)
          end
        }

    scope :filter_on_search, ->(search, search_on_state) {
        if search.to_i.to_s == search
            where("UPPER(name) LIKE UPPER(?) OR UPPER(description) LIKE UPPER(?) OR price = ? OR state = ?", 
            "%#{search}%", "%#{search}%", search.to_i, search_on_state) 
        else
            where("UPPER(name) LIKE UPPER(?) OR UPPER(description) LIKE UPPER(?) OR state = ?", 
            "%#{search}%", "%#{search}%", search_on_state) 
        end
    }

    has_one :dish_in_orders
end
