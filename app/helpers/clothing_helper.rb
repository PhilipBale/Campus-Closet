module ClothingHelper
  GENDERS = ['Male', 'Female']
  TYPES = ['Jacket', 'Pants', 'Skirt', 'Shirt', 'Tie']

  def get_all_clothing
	Clothing.all
  end

  def get_all_sizes(type)
  	Clothing.select(:size).map(&:size).uniq
  end
end
