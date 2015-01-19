class AccountController < ApplicationController
  def view
  	if params[:supplied_email] != nil && logged_in? && current_user.admin
  	  @display_user = find_by_email(params[:supplied_email])
 	else
 	  @display_user = current_user
 	end

 	@rentals = current_user.rentals.order('created_at DESC')
 	@pick_ups = @rentals.select { |rental| rental.active == true && rental.picked_up == false}
  end

  def rent
  	rent_clothing(current_user.id, params[:clothing_code])
  	redirect_to account_path
  end

  def cancel
  	cancel_rental(params[:rental_code])
  	redirect_to account_path
  end
end
