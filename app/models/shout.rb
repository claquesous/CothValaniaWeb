class Shout < ActiveRecord::Base
  belongs_to :member
  attr_accessible :date, :text
  validates_presence_of :date, :text, :member
end
