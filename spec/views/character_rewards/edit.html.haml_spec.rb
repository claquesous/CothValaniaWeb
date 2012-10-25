require 'spec_helper'

describe "character_rewards/edit" do
  before(:each) do
    @character_reward = assign(:character_reward, stub_model(CharacterReward,
      :character => nil,
      :reward => nil,
      :preference => 1,
      :obtained => false,
      :reward_cycle => 1,
      :obtained_points => 1,
      :remarks => "MyString"
    ))
  end

  it "renders the edit character_reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_rewards_path(@character_reward), :method => "post" do
      assert_select "input#character_reward_character", :name => "character_reward[character]"
      assert_select "input#character_reward_reward", :name => "character_reward[reward]"
      assert_select "input#character_reward_preference", :name => "character_reward[preference]"
      assert_select "input#character_reward_obtained", :name => "character_reward[obtained]"
      assert_select "input#character_reward_reward_cycle", :name => "character_reward[reward_cycle]"
      assert_select "input#character_reward_obtained_points", :name => "character_reward[obtained_points]"
      assert_select "input#character_reward_remarks", :name => "character_reward[remarks]"
    end
  end
end
