require 'spec_helper'

describe "character_requirements/edit" do
  before(:each) do
    @character_requirement = assign(:character_requirement, stub_model(CharacterRequirement,
      :obtained_occurrence => nil,
      :character => nil,
      :used => false,
      :used_occurrence => nil
    ))
  end

  it "renders the edit character_requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_requirements_path(@character_requirement), :method => "post" do
      assert_select "input#character_requirement_obtained_occurrence", :name => "character_requirement[requirement_obtained_occurrence]"
      assert_select "input#character_requirement_character", :name => "character_requirement[character]"
      assert_select "input#character_requirement_used", :name => "character_requirement[used]"
      assert_select "input#character_requirement_used_occurrence", :name => "character_requirement[requirement_used_occurrence]"
    end
  end
end
