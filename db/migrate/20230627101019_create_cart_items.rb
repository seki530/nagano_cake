class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.integer :amount, null: false
      t.integer :customer_id
      t.integer :item_id
      
      t.timestamps
    end
  end
end
