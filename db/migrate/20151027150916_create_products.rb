class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name, null: false
    	t.text :description, null: true
    	t.decimal :price, precision: 10, scale: 2, null: false
        t.belongs_to :product_category, index: true
    	t.text :image, null: true

    	t.timestamps null: false
    end
  end
end
