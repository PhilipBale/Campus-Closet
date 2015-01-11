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
  validates :clothing_code, presence: true
  validates_inclusion_of :clothing_type, in: ClothingHelper.TYPES
  validates_inclusion_of :gender, in: ClothingHelper.GENDERS
  validates :size, presence: true
end
