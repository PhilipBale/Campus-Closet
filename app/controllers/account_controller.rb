class AccountController < ApplicationController
  def view
  	if params[:supplied_email] != nil && logged_in? && current_user.admin
  	  @display_user = find_by_email(params[:supplied_email])
 	else
 	  @display_user = current_user
 	end

 	@rentals = current_user.rentals
  end

  def rent
  	clothing_code = params[:clothing_code]
  	Rental.create(user_id: current_user.id, clothing_id: clothing_code)
  	redirect_to account_path
  end
end
