class Cart < ApplicationRecord
	has_many :cart_production_detailss
	has_many :prodution_details, through: :cart_production_detailss
	serialize :content, JSON
	belongs_to :user
	scope :cart_destroy, -> {where('created_at < ?', 1.day.ago)}

end
