Then /^I should not see any news articles$/ do
  page.should_not have_selector('news')
end

Given /^There is a News entry with text "(.*)"$/ do |text|
  visit '/news/new'
  fill_in 'Text', :with => text
  click_on "Save"
end

Given /^There are no News entries$/ do
  News.delete_all
end

