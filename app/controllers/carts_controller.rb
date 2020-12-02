class CartsController < ApplicationController
	before_action :set_cart, only: [:update]
	before_action :authenticate_user!
	def index
		if current_cart.content.nil?
			redirect_back fallback_location: current_cart, notice: t("carts.index.notice")
		end
	end	
	def show
	end	
	def update

			@production_detai = ProductionDetail.find_by(color: params[:color], rom: params[:rom], ram: params[:ram], production_id: params[:production_id]) 
			quantity_production_detail = params[:quantity]
			id_production_detail = @production_detai.id
			@hash_content = current_cart.content
			if @hash_content.nil?
				@hash_content ={"#{id_production_detail}": quantity_production_detail}			
			elsif @hash_content.has_key?("#{id_production_detail}")&& params[:cart_identy].nil?
				@old_quantity = current_cart.content["#{id_production_detail}"]
				@hash_content[:"#{id_production_detail}"] = quantity_production_detail.to_i + @old_quantity.to_i
			else

				@hash_content[:"#{id_production_detail}"] = quantity_production_detail
			end
			current_cart.update!(content: @hash_content, user_id: current_user.id)
			@quantity = current_cart.content["#{id_production_detail}"]

			 render json:  {
			    "success": true,
			     "value": [{
			       "quantity": @quantity,
			       "success": "ok",
			       "code": "200"       
			     }]
			}
				 	  
		
	end

	def destroy
		id_production_detail = params[:production_detail_id]
		@hash_content = current_cart.content.reject!{|key, value| key == "#{id_production_detail}"}
		if @hash_content.empty?
			@hash_content =  nil
		end
		current_cart.update!(content: @hash_content)
		flash.now[:success] = "san pham xoa thanh cong "
		render json: {   
	      current_cart:  current_cart
      	}, status: :ok 
	end
	private 
	def set_cart
		@cart = current_cart.id
	end	
end