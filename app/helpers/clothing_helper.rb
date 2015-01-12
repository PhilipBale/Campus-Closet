module ClothingHelper
  GENDERS = ['Male', 'Female']
  TYPES = ['Jacket', 'Pants', 'Skirt', 'Shirt', 'Tie']
  STATUS = ['Reserved', 'Available', 'Borrowed']

  def get_all_sizes(type)
  	Clothing.select(:size).order('size asc').map(&:size).uniq
  end
end
