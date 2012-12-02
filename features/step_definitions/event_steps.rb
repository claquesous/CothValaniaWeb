Given /^There are events named: "(.*)"$/ do |events|
  events.split("\", \"").each do |event|
    FactoryGirl.create(:event, name: event)
  end
end

Given /^There is an event named "(.*?)" which is worth (\d+) points$/ do |event, points|
  Event.create(name: event, points: points)
end

