class Product < ActiveRecord::Base
	belongs_to :product_category
	
	validates :name, :price, presence: true 
	validates :price, numericality: true
end
