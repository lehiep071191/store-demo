class ProductionDetail < ApplicationRecord
	belongs_to :production
	has_many :cart_prodution_details
	has_many :cart, through: :cart_production_details
	has_many :order_details
	validates :color, presence: true
	validates :ram, presence: true
	validates :rom, presence: true
	validates :price, presence: true
	scope :order_by_discount,-> {order(:discount, :desc)}
	def discount_price
    if self.discount.present?
        self.price -= self.price* self.discount / 100
    else
       self.price 
    end
  end
end
