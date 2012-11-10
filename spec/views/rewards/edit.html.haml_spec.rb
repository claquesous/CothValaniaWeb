require 'spec_helper'

describe "rewards/edit" do
  before(:each) do
    @reward = assign(:reward, stub_model(Reward,
      :name => "MyString",
      :external_value => 1,
      :remarks => "MyString"
    ))
    assign(:events, [stub_model(Event)])
  end

  it "renders the edit reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rewards_path(@reward), :method => "post" do
      assert_select "input#reward_name", :name => "reward[name]"
      assert_select "input#reward_external_value", :name => "reward[external_value]"
      assert_select "input#reward_remarks", :name => "reward[remarks]"
    end
  end
end
