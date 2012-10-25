require 'spec_helper'

describe "character_requirements/show" do
  before(:each) do
    @character_requirement = assign(:character_requirement, stub_model(CharacterRequirement,
      :requirement_attainment => nil,
      :character => nil,
      :used => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
