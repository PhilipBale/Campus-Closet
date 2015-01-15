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
      	  link_to "Borrow", rent_clothing_path(clothing)
        else
          link_to "Log in", login_path
        end
      else
      	Unavailable
      end
    end
	
end
