Given /^I am on the new occurrence page for "(.*?)"$/ do |event|
  visit "/events/#{Event.find_by_name(event).id}/occurrences/new"
end

