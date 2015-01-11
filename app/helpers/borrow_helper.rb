module BorrowHelper
	include ClothingHelper

	def get_genders
	  GENDERS
	end

	def get_types
	  TYPES
	end

	def get_clothing
		Clothing.all
	end
end
