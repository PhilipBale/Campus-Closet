# == Schema Information
#
# Table name: rentals
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  start       :datetime
#  end         :datetime
#  picked_up   :boolean
#  active      :boolean          default("t")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clothing_id :integer
#

require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
