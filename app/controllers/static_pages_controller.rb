class StaticPagesController < ApplicationController
  def home
  end

  def sizing
  end

  def contact
  	@user_contact = UserContact.new
  end

  def send_contact
  	@user_contact = UserContact.new(params[:user_contact])
  	@user_contact.request = request
  	if @user_contact.deliver
      flash.now[:success] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.' 
    end

    render :contact
  end

end
