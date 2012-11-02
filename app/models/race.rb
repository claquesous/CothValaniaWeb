class Race < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :characters
end
