module BorrowHelper
	include ClothingHelper

	def get_genders
	  GENDERS
	end

	def get_types
	  TYPES
	end

	def can_borrow(clothing)
      if true
      	if logged_in?
      	  raw('<a href="#">Borrow</a>')
        else
          link_to "Log in", login_path
        end
      else
      	Unavailable
      end
    end
	
end
