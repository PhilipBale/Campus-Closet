module AccountHelper

	def details(rental)
      if rental.active && !rental.picked_up 
      	link_to "Cancel Reservation", cancel_rental_path(rental.id)
      end
    end
end
