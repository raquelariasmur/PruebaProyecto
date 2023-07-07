json.extract! dish, :id, :name, :description, :price, :photography, :state, :created_at, :updated_at
json.url dish_url(dish, format: :json)
