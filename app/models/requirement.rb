class Requirement < ActiveRecord::Base
  default_scope order(:name)
  attr_accessible :name, :reusable, :multiple, :requirement_obtainments_attributes, :event_requirements_attributes
  has_many :requirement_obtainments, dependent: :destroy
  accepts_nested_attributes_for :requirement_obtainments, :allow_destroy => true
  has_many :event_requirements, dependent: :destroy
  accepts_nested_attributes_for :event_requirements, :allow_destroy => true
  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, uri_eligibility: true
  has_many :character_requirements, dependent: :destroy
end
