class BorrowController < ApplicationController 

	def borrow
		@clothing_results=Clothing.search nil
	end

	def search 
		@clothing_results= Clothing.search params[:borrow_search]
		render "borrow/borrow"
	end

	def import
      Clothing.import(params[:file])
    end

	private
	    def search_params
	      params.require(:borrow_search).permit(:gender, :type, :size)
	    end
end
