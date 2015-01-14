class AccountController < ApplicationController
  def view
  	if params[:supplied_email] != nil && logged_in? && current_user.admin
  	  @display_user = find_by_email(params[:supplied_email])
 	else
 	  @display_user = current_user
 	end
  end
end
