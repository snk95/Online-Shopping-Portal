class ShopperController < ApplicationController
  skip_before_action :authorize
  
  include CurrentCart
  before_action :set_cart
  
  def index
  	if params[:term]
    	@products = Product.where("name LIKE ? OR image LIKE ? OR description LIKE ? OR price LIKE ?", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%").order(:name)
  	else
  		@products = Product.order(:name)
  	end
  end

end

