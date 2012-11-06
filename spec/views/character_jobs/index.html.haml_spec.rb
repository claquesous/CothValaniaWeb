require 'spec_helper'

describe "character_jobs/index" do
  before(:each) do
    assign(:character_jobs, [
      stub_model(CharacterJob,
        :character => stub_model(Character, :name=>"Character"),
        :job => stub_model(Job, :name => "Job"),
        :level => 1
      ),
      stub_model(CharacterJob,
        :character => stub_model(Character, :name=>"Character"),
        :job => stub_model(Job, :name => "Job"),
        :level => 1
      )
    ])
  end

  it "renders a list of character_jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Character".to_s, :count => 2
    assert_select "tr>td", :text => "Job".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
