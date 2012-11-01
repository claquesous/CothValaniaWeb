Given /^"(.*?)" attended "(.*?)"$/ do |character, event|
  eo = EventOccurrence.new
  eo.event = Event.find_by_name(event)
  eo.save
  ea = EventAttendance.new
  ea.event_occurrence = eo
  ea.character = Character.find_by_name(character)
  ea.save
end

