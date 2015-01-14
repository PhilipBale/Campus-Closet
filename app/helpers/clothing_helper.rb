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
end
