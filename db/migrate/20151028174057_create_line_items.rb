class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :order, index: true
      t.integer :product_id, null: false
    	t.integer :quantity, null: false
    	t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps null: false
    end

    add_index :line_items, :product_id
  end
end
