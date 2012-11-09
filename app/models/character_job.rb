class CharacterJob < ActiveRecord::Base
  belongs_to :character
  belongs_to :job
  attr_accessible :level, :job_id
  validates_uniqueness_of :job_id, :scope => :character_id
  validates_presence_of :character, :job
end
