require 'spec_helper'

describe "event_rewards/new" do
  before(:each) do
    assign(:event_reward, stub_model(EventReward).as_new_record)
  end

  it "renders new event_reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_rewards_path, :method => "post" do
    end
  end
end
