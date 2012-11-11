require 'spec_helper'

describe "character_rewards/show" do
  before(:each) do
    @character_reward = assign(:character_reward, stub_model(CharacterReward,
      :character => nil,
      :reward => nil,
      :occurrence => nil,
      :preference => 1,
      :obtained => false,
      :reward_cycle => 2,
      :obtained_points => 3,
      :remarks => "Remarks"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Remarks/)
  end
end
