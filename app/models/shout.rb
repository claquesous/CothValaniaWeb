class Shout < ActiveRecord::Base
  default_scope order("id desc")
  belongs_to :member
  attr_accessible :date, :text
  validates_presence_of :date, :text, :member
end
