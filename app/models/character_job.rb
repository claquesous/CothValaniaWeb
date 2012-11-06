class CharacterJob < ActiveRecord::Base
  belongs_to :character
  belongs_to :job
  attr_accessible :level
end
