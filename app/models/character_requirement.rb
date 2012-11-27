class CharacterRequirement < ActiveRecord::Base
  # A CharacterRequirement is something obtained through an occurrence
  # that can be used to satisfy an occurrences requirements
  belongs_to :character
  attr_accessible :used, :character_id, :requirement_id
  belongs_to :obtained_occurrence, :class_name => "Occurrence"
  belongs_to :used_occurrence, :class_name => "Occurrence"
  belongs_to :requirement
  validates_presence_of :character, :requirement
end
