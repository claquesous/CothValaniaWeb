When /^I click the "(.*)" link$/ do |link|
  click_link link
end

Given /^I am on the "Login" page$/ do
  visit '/login'
end

Then /^I should see "(.*)"$/ do |message|
  page.should have_content(message)
end

Then /^I should be on the root page$/ do
  # Home page has two different possible places
  current_path.should == "/"
end

Then /^I should be on the "Login" page$/ do
  current_path.should == login_path
end

