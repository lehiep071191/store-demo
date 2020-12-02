class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :production_detail
end
