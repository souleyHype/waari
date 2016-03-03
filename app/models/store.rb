class Store < ActiveRecord::Base
	has_many :order, inverse_of: :store

	validates :location_name, presence: true
end
