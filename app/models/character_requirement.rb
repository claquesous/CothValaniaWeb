class CharacterRequirement < ActiveRecord::Base
  # A CharacterRequirement is something obtained through an event_occurrence
  # that can be used to satisfy an event_occurrences requirements
  belongs_to :character
  attr_accessible :used
  has_one :obtained_event_occurrence, :class_name => "EventOccurrence"
  has_one :used_event_occurrence, :class_name => "EventOccurrence"
end
