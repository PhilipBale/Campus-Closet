class UsersController < ApplicationController

	def show
    	@user = User.find(params[:id])
    end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
	    if @user.save
	      log_in @user
	      flash[:success] = "Succesful Registration"
	      redirect_to root_path
	    else
	      render 'login/login'
	    end
	end

	private
	    def user_params
	      params.require(:user).permit(:name, :email, :phone, :password,
	                                   :password_confirmation)
	    end
end
