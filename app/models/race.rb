class Race < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :characters
  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, uri_eligibility: true
end
