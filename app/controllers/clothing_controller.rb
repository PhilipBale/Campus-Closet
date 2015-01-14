class ClothingController < ApplicationController
  
  def new
  end

  def show
  	@clothing = Clothing.where("clothing_code = ?", params[:id]).first
  	
  	if @clothing.blank? || @clothing == nil
  		@clothing = Clothing.find_by_id(params[:id])
  	end
 	
 	if @clothing.present?
      @barcode_for_html = generate_barcode_html(@clothing.clothing_code)
      full_path = "barcodes/#{@barcode}.png"
      # blob = Barby::PngOutputter.new(@barcode) #Raw PNG data
      # File.open(full_path, 'w'){ |f| f.write blob.to_png(:margin => 3, :xdim => 2, :height => 55) }
    end
  end
end
