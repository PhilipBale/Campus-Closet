class ClothingController < ApplicationController
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'
  require 'barby/outputter/html_outputter'
  
  def new
  end

  def show
  	@clothing = Clothing.where("clothing_code = ?", params[:id]).first
  	
  	if @clothing.blank? || @clothing == nil
  		@clothing = Clothing.find_by_id(params[:id])
  	end
 	
 	if @clothing.present?
      @barcode = Barby::Code128B.new(@clothing.clothing_code)
      @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
      blob = Barby::PngOutputter.new(@barcode).to_png #Raw PNG data
      File.open('barcode.png', 'w'){|f| f.write blob }
    end
  end
end
