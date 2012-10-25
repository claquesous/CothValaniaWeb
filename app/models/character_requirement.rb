class CharacterRequirement < ActiveRecord::Base
  belongs_to :requirement_attainment
  belongs_to :character
  attr_accessible :obtained_date, :used, :used_date
end
