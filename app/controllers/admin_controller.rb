class AdminController < ApplicationController
  def show
  	if params[:subpage] != nil
  		@subpage = params[:subpage]

      if @subpage == "clients"
        @clients = User.all
      end
  	end
  end

  def print_res
  	@clothing = find_clothing("M10A")
  	@barcode_for_html = generate_barcode_html(@clothing.clothing_code)
  	render layout: false
  end

  def print_all_labels
    @clothing = Clothing.all
    render layout: false;
  end
end
