When /^I click the "(.*)" link$/ do |link|
  click_link link
end

Given /^I am on the "Login" page$/ do
  visit '/login'
end

Given /^I am on the home page$/ do
  visit '/'
end

Then /^I should (not )?see "([^\"]+)"$/ do |n,message|
  eval %Q{page.should#{"_not" unless n.nil?} have_content(message)}
end

Then /^I should be on the root page$/ do
  current_path.should == "/"
end

Then /^I should be on the "Login" page$/ do
  current_path.should == login_path
end

Then /^I should see an? "([^\"]+)" link$/ do |l|
  page.should have_link(l)
end

