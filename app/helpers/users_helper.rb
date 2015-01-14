module UsersHelper

  def find_by_email(email)
	User.where("email = ?", email).first
  end
end
