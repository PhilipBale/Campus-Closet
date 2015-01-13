class AdminController < ApplicationController
  def show
  	if params[:subpage] != nil
  		@subpage = params[:subpage]
  	end
  end
end
