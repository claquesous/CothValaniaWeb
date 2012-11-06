require 'spec_helper'

describe "characters/index" do
  before(:each) do
    assign(:characters, [
      stub_model(Character,
        :name => "Name",
        :remarks => "Remarks",
	:member => mock_model("Member", :name => "Member"),
	:race => mock_model("Race", :name => "Race"),
	:sex => "Male",
      ),
      stub_model(Character,
        :name => "Name",
        :remarks => "Remarks",
	:member => mock_model("Member", :name => "Member"),
	:race => mock_model("Race", :name => "Race"),
	:sex => "Male",
      )
    ])
    assign(:jobs, [ 
      stub_model(Job,
	:short_name => "Job",
      )
    ])
    assign(:character_jobs, [])
  end

  it "renders a list of characters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => "Member".to_s, :count => 2
    assert_select "tr>td", :text => "Race".to_s, :count => 2
    assert_select "tr>td", :text => "Male".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
