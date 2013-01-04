Given /^There are events named: "(.*)"$/ do |events|
  events.split("\", \"").each do |event|
    FactoryGirl.create(:event, name: event)
  end
end

Given /^There is an event named "(.*?)"( which is worth (\d+) points)?$/ do |event, has_points, points|
  points = 0 unless has_points
  Event.create!(name: event, points: points)
end

