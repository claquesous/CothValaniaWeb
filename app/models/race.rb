class Race < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :characters
  validates_uniqueness_of :name
  validates_presence_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end
end
