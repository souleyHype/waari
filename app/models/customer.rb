class Customer < ActiveRecord::Base
	has_many :order

	validates :first_name, :last_name, presence: true
end
