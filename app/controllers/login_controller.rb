class LoginController < ApplicationController
  def login
  	@user = User.new
  end
end
