Given /^I am on the new occurrence page for "(.*?)"$/ do |event|
  visit new_event_occurrence_path(Event.find_by_name(event))
end

