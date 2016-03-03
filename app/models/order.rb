class Order < ActiveRecord::Base
	belongs_to :customer
	belongs_to :store
	has_many :line_items
	has_many :products, through: :line_items

	validates :order_number, :customer_id, :store_id, :sales_amount, presence: true 
	validates :sales_amount, numericality: true
end
