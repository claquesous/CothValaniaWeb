require 'spec_helper'

describe "character_rewards/index" do
  before(:each) do
    assign(:character_rewards, [
      stub_model(CharacterReward,
        :character => nil,
        :reward => nil,
        :event_occurrence => nil,
        :preference => 1,
        :obtained => false,
        :reward_cycle => 2,
        :obtained_points => 3,
        :remarks => "Remarks"
      ),
      stub_model(CharacterReward,
        :character => nil,
        :reward => nil,
	:event_occurrence => nil,
        :preference => 1,
        :obtained => false,
        :reward_cycle => 2,
        :obtained_points => 3,
        :remarks => "Remarks"
      )
    ])
  end

  it "renders a list of character_rewards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 6
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
  end
end
