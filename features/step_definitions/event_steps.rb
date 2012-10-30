Given /^There are events named: (".*")$/ do |events|
  events.split(", ").each do |event|
    FactoryGirl.create(:event, name: event)
  end
end

