class CharacterRequirement < ActiveRecord::Base
  # A CharacterRequirement is something obtained through an event_occurrence
  # that can be used to satisfy an event_occurrences requirements
  belongs_to :character
  attr_accessible :used
  belongs_to :obtained_event_occurrence, :class_name => "EventOccurrence"
  belongs_to :used_event_occurrence, :class_name => "EventOccurrence"
end
