class CharacterReward < ActiveRecord::Base
  belongs_to :character
  belongs_to :reward
  attr_accessible :obtained, :obtained_date, :obtained_points, :preference, :remarks, :reward_cycle
end
