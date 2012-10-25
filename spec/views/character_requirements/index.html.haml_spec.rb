require 'spec_helper'

describe "character_requirements/index" do
  before(:each) do
    assign(:character_requirements, [
      stub_model(CharacterRequirement,
        :requirement_attainment => nil,
        :character => nil,
        :used => false
      ),
      stub_model(CharacterRequirement,
        :requirement_attainment => nil,
        :character => nil,
        :used => false
      )
    ])
  end

  it "renders a list of character_requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
