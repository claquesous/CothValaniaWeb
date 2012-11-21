Given /^"(.*?)" attended "(.*?)"$/ do |character, event|
  o = FactoryGirl.build(:occurrence)
  o.event = Event.find_by_name(event)
  o.save
  ea = EventAttendance.new
  ea.occurrence = o
  ea.character = Character.find_by_name(character)
  ea.save
end

