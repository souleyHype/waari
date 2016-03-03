class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :store, index: true
      t.integer :order_number, null: false
    	t.decimal :sales_amount, precision: 10, scale: 2, null: false
    	t.string :payment_type
      t.datetime :order_date

      t.timestamps null: false
    end
  end
end
