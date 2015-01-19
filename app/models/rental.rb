# == Schema Information
#
# Table name: rentals
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  start       :datetime
#  end         :datetime
#  picked_up   :boolean          default("f")
#  active      :boolean          default("t")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clothing_id :integer
#

class Rental < ActiveRecord::Base
  belongs_to :user
  has_one :clothing

  after_initialize :assign_dates

  validates :user_id, presence: true
  validates :clothing_id, presence: true

  def assign_dates
  	self.start ||= Time.now
  	self.end ||= 2.days.from_now
  end
end
