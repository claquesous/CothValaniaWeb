Given /^Event "(.*?)" (has|satisfies) requirement "(.*?)"$/ do |event_name, relation, requirement|
  req = Requirement.find_by_name(requirement)
  visit "/requirements/#{req.nil? ? "new" : "#{req.to_param}/edit"}"
  page.should have_content(event_name)
  case relation
  when "has"
    check "requirement_event_requirements_attributes_#{event_name}__destroy"
  when "satisfies"
    check "requirement_requirement_obtainments_attributes_#{event_name}__destroy"
  end
  fill_in "Name", :with => requirement
  click_on "Save"
end

Given /^"(.*?)" has satisfied requirement "(.*?)"$/ do |char, requirement|
  character = Character.find_by_name(char)
  character.character_requirements.create(:requirement_id => Requirement.find_by_name(requirement).id)
end

Then /^I check the "(.*?)" requirement for "(.*?)"$/ do |req, char|
  CharacterRequirement.where(:requirement_id => Requirement.find_by_name(req), :character_id => Character.find_by_name(char), :used_occurrence_id => nil).each do |cr|
    check "occurrence_used_requirement_ids_#{cr.id}"
  end
end

Then /^I check the obtained "(.*?)" for "(.*?)"$/ do |req, char|
  check "occurrence_obtained_requirements_attributes_#{char}__destroy"
end

