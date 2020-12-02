class CartProduction < ApplicationRecord
	belongs_to :cart 
	belongs_to :production_detail
end
