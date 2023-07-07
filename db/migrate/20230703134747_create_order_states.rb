class CreateOrderStates < ActiveRecord::Migration[7.0]
  def change
    create_table :order_states do |t|
      t.string :name
      t.integer :time_in_minutes

      t.timestamps
    end
  end
end
