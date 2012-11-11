class CharacterReward < ActiveRecord::Base
  belongs_to :member
  belongs_to :character
  belongs_to :reward
  belongs_to :occurrence
  attr_accessible :obtained, :obtained_points, :preference, :remarks, :reward_cycle
  validates_uniqueness_of :preference, :scope => :member_id
  validates_associated :member, :reward
end
