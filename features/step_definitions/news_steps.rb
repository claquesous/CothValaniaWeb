Then /^I should not see any news articles$/ do
  page.should_not have_selector('news')
end

Given /^There is a News entry with text "(.*)"$/ do |text|
  FactoryGirl.create(:news, text: text)
end

Given /^There are no News entries$/ do
  News.delete_all
end

