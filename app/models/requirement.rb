class Requirement < ActiveRecord::Base
  default_scope order(:name)
  attr_accessible :name, :reusable, :multiple, :requirement_obtainments_attributes, :event_requirements_attributes
  has_many :requirement_obtainments
  accepts_nested_attributes_for :requirement_obtainments, :allow_destroy => true
  has_many :event_requirements
  accepts_nested_attributes_for :event_requirements, :allow_destroy => true
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :character_requirements

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end
end
