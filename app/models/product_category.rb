class ProductCategory < ActiveRecord::Base
	has_many :product

	validates :name, presence: true
end
