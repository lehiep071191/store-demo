module ApplicationHelper

	def options_for_color
		@production.production_details.pluck(:color).uniq
	end
	def options_for_rom
		@production.production_details.pluck(:rom).uniq	
	end
	def options_for_ram
		@production.production_details.pluck(:ram).uniq
	end
	def total_payment
		@sum = 0
			current_cart.content.each do |key,value|
				production_detail= ProductionDetail.find_by id:key
				 @sum +=  production_detail.discount_price*value.to_i
			end
		@sum
	end

	def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
  def number_to_vnd(price)
  	number_to_currency(price ,:unit=>'VND')
  end	
  def array_production
  	Production.all.limit(24).each_slice(4).to_a
  end
  def array_production2
  	Production.all.each_slice(6).to_a
  end
end
