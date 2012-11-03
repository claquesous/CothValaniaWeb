class Race < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :characters

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end
end
