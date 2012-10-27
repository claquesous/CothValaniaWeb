class CharacterReward < ActiveRecord::Base
  belongs_to :character
  belongs_to :reward
  belongs_to :event_occurrence
  attr_accessible :obtained, :obtained_points, :preference, :remarks, :reward_cycle
end
