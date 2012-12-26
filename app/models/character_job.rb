class CharacterJob < ActiveRecord::Base
  belongs_to :character
  belongs_to :job
  has_many :event_attendances
  attr_accessible :level, :job_id
  validates_uniqueness_of :job_id, :scope => :character_id
  validates_presence_of :character, :job
end
