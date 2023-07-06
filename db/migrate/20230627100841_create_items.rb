class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_sales_status, default: false, null: false

      t.timestamps
    end
  end
end
