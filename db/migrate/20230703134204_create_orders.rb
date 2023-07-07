class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :subtotal
      
      t.references :order_state
      t.references :client
      t.timestamps
    end
  end
end
