class News < ActiveRecord::Base
  belongs_to :member
  attr_accessible :date, :text
end
