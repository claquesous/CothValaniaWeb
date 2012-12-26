Given /^There are jobs named "(.*?)"$/ do |jobs|
  jobs.split("\", \"").each do |job|
    visit '/jobs/new'
    fill_in "Name", :with=> job
    click_on "Save"
    page.body.should have_content "Job was successfully created"
  end
end

Then /^"(.*?)" has the job "(.*?)"$/ do |character, job|
  visit member_path(Character.find_by_name(character).member)
  click_on "Edit"
  first("input[type='checkbox']", job).click
  click_on "Save"
  page.body.should have_content "Member was successfully updated"
end

Given /^"(.*?)" has job "(.*?)"$/ do |character, job|
  visit '/members'
  click_on character
  click_on 'Edit'
  check job
  click_on 'Save'
  page.body.should have_content "Member was successfully updated"
end
