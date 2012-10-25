require 'spec_helper'

describe "event_rewards/index" do
  before(:each) do
    assign(:event_rewards, [
      stub_model(EventReward),
      stub_model(EventReward)
    ])
  end

  it "renders a list of event_rewards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
