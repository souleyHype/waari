class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.text :email

      	t.timestamps null: false
    end
  end
end
