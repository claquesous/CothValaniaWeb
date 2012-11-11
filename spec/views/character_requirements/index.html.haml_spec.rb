require 'spec_helper'

describe "character_requirements/index" do
  before(:each) do
    assign(:character_requirements, [
      stub_model(CharacterRequirement,
        :obtained_occurrence => nil,
        :character => nil,
        :used => false,
        :used_occurrence => nil
      ),
      stub_model(CharacterRequirement,
        :obtained_occurrence => nil,
        :character => nil,
        :used => false,
        :used_occurrence => nil
      )
    ])
  end

  it "renders a list of character_requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 6
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
