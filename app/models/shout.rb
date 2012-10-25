class Shout < ActiveRecord::Base
  belongs_to :character
  attr_accessible :date, :text
end
