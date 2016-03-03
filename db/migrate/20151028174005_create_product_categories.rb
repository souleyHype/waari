class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
    	t.string :name, null: false
    	t.text :description
    	t.text :image

      	t.timestamps null: false
    end
  end
end
