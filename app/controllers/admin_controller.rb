class AdminController < ApplicationController
  include BorrowHelper
  include ClothingHelper

  def show
  	if params[:subpage] != nil
  		@subpage = params[:subpage]

      if @subpage == "clients"
        @clients = User.all
      end

      if @subpage == "reports"
        @rentals = Rental.all.order('created_at DESC')
        @active = @rentals.select { |rental| rental.active == true}
        @expired = @active.select { |rental| Time.now > rental.end}
      end
  	end
  end

  def print_res
  	@rental = Rental.find(params[:rescode])
    @clothing = Clothing.find(@rental.clothing_id)
    @user = User.find(@rental.user_id)
  	@barcode_for_html = generate_barcode_html(pad_clothing_code(@rental.id.to_s))
  	render layout: false
  end

  def print_dry_clean
    @rental = Rental.find(params[:rescode])
    @user = User.find(@rental.user_id)
    @barcode_for_html = generate_barcode_html(pad_clothing_code(@rental.id.to_s))
    render layout: false
  end

  def print_all_labels
    @clothing = Clothing.all
    render layout: false;
  end

  def rent_clothing(email, clothing_code)
  end

  def show_cart
    @user = find_by_email(params[:email] + ".edu")
    @rentals = @user.rentals
    render layout: false
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
          flash[:success] = "Clothing successfully added!"
        end
      end
    elsif params[:remove_clothing]
      remove = find_clothing(params[:remove_clothing][:clothing_code])
      if remove != nil && remove.present?
        remove.update_attribute(:active, false)
        flash[:success] = "Clothing successfully removed!"
      end
    elsif params[:rent_clothing]
      rental = Rental.find(params[:rent_clothing][:rental_id])
      if rental != nil && rental.present?
        rental.update_attribute(:picked_up, true)
        rental.update_attribute(:start, Time.now)
        rental.update_attribute(:end, 14.days.from_now)
        flash[:success] = "Rental successfully made!"
      end
    elsif params[:return_clothing]
      rental = Rental.find(params[:return_clothing][:rental_id])
      if rental != nil && rental.present?
        rental.update_attribute(:active, false)
        rental.update_attribute(:end, Time.now)
        flash[:success] = "Return successfully made!"
      end
    elsif params[:create_rental]
      renter = find_by_email(params[:create_rental][:email])
      cloth = find_clothing(params[:create_rental][:clothing_code])
      if !is_rented_or_reserved?(cloth.id) && renter != nil
        Rental.create(user_id: renter.id, clothing_id: cloth.id)
        flash[:success] = "Rental successfully created!"
      else
        flash[:danger] = "Clothing ID already rented or incorrect parameter"
      end
    end
      
    
    render "admin/show"
  end

end
