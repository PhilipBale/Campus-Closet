class AdminController < ApplicationController
  include BorrowHelper

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

  def rent_clothing(email, clothing_code)
  end

  def show_cart(email)
  end

  def handle 
    if params[:add_clothing]
      clothing = find_clothing(params[:add_clothing][:clothing_code])
      if clothing != nil && clothing.present?
        flash[:success] = "Marking clothing as active!"
        clothing.update_attribute(:active, true)
      else
        cloth = Clothing.new(:clothing_code => params[:add_clothing][:clothing_code], :gender => params[:add_clothing][:gender], :clothing_type => params[:add_clothing][:clothing_type], :size => params[:add_clothing][:size], :color => params[:add_clothing][:color])
        if cloth.save
          flash[:success] = "Clothing successfully added"
        end
      end
    elsif params[:remove_clothing]
      remove = find_clothing(params[:remove_clothing][:clothing_code])
      if remove != nil && remove.present?
        remove.update_attribute(:active, false)
        flash[:success] = "Clothing successfully removed"
      end
    end
      
    
    render "admin/show"
  end

end
