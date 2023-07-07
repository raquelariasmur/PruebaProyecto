class CreateDishOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_in_orders do |t|
      t.integer :amount

      t.belongs_to :dish
      t.belongs_to :order
      
      t.timestamps
    end
  end
end
