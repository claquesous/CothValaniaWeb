require 'spec_helper'

describe "event_rewards/show" do
  before(:each) do
    @event_reward = assign(:event_reward, stub_model(EventReward))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
