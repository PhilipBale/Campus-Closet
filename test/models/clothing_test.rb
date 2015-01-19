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
#  active        :boolean          default("t")
#

require 'test_helper'

class ClothingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
