Given /^I have a member named "(.*?)"$/ do |member|
  FactoryGirl.create(:member, name: member)
end

Then /^I should see "(.*?)" has (\d+) points$/ do |member, points|
  page.find_by_id(member).text.should include(points)
end

