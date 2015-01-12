class ClothingController < ApplicationController
  def new
  end

  def show
  	@clothing = Clothing.where("clothing_code = ?", params[:id]).first
  	
  	if @clothing.blank? || @clothing == nil
  		@clothing = Clothing.find_by_id(params[:id])
  	end
  end
end
