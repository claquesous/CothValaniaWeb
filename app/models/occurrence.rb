class Occurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success, :event_attendances_attributes, :obtained_requirements_attributes
  # An event can have many attendees
  has_many :event_attendances, :dependent => :destroy, :inverse_of => :occurrence
  has_many :characters, :through => :event_attendances
  # It can provide many rewards to characters
  has_many :character_rewards
  # It can provide requirements
  has_many :obtained_requirements, :class_name => "CharacterRequirement", :foreign_key => "obtained_occurrence_id"
  # It may have requirements
  has_many :used_requirements, :class_name => "CharacterRequirement", :foreign_key => "used_occurrence_id"
  # Most important is that it is an occurrence of Event
  belongs_to :event
  validates_presence_of :event
  accepts_nested_attributes_for :event_attendances, :allow_destroy => true
  accepts_nested_attributes_for :obtained_requirements, :allow_destroy => true
end
