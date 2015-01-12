# == Schema Information
#
# Table name: clothings
#
#  id            :integer          not null, primary key
#  clothing_code :string
#  clothing_type :string
#  gender        :string
#  color         :string
#  size          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Clothing < ActiveRecord::Base
  include ClothingHelper

  validates :clothing_code, presence: true
  validates_inclusion_of :clothing_type, in: TYPES
  validates_inclusion_of :gender, in: GENDERS
  validates :size, presence: true

  def self.search(search)
	if search
      results = Clothing.where("gender = ? AND clothing_type = ? AND size = ?", search[:gender], search[:type], search[:size])
    else
      Clothing.all
    end
  end

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  	  Clothing.create! row.to_hash
  	end
  end
end
