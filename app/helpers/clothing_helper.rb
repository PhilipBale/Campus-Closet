module ClothingHelper
  GENDERS = ['Male', 'Female']
  TYPES = ['Jacket', 'Pants', 'Skirt', 'Shirt', 'Tie']
  STATUS = ['Reserved', 'Available', 'Borrowed']

  def get_all_sizes(type)
  	Clothing.select(:size).order('size asc').map(&:size).uniq
  end

  def pad_clothing_code(code)
  	code.rjust(8, '0')
  end

  def find_clothing(code)
  	clothing = Clothing.where("clothing_code = ?", code).first
  end

  def rent_clothing(user_id, clothing_id)
    Rental.create(user_id: user_id, clothing_id: clothing_id)
  end

  def cancel_rental(rental_id)
    rental = Rental.find(rental_id).update_attribute(:active, false)
  end

  def is_rented_or_reserved?(clothing_id)
    Rental.where("active = ? AND clothing_id = ?", true, clothing_id).count > 0
  end

  def can_borrow(clothing)
    if true
      if logged_in?
        if is_rented_or_reserved?(clothing)
          "Unavailable"
        else
          link_to "Reserve", rent_clothing_path(clothing)
        end
      else
        link_to "Log in", login_path
      end
    else
      Unavailable
    end
  end

  def get_last_rental(user)
    if user.rentals.last != nil
      time_format(user.rentals.last.start)
    else
      "Never"
    end
  end
end
