class LineItem < ActiveRecord::Base
	belongs_to :order

	validates :order_id, :product_id, :quantity, :price, presence: true 
	validates :price, numericality: true
end
