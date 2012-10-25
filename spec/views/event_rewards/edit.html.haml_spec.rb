require 'spec_helper'

describe "event_rewards/edit" do
  before(:each) do
    @event_reward = assign(:event_reward, stub_model(EventReward))
  end

  it "renders the edit event_reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_rewards_path(@event_reward), :method => "post" do
    end
  end
end
