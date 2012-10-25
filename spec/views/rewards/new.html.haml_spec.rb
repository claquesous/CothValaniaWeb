require 'spec_helper'

describe "rewards/new" do
  before(:each) do
    assign(:reward, stub_model(Reward,
      :name => "MyString",
      :external_value => 1,
      :remarks => "MyString"
    ).as_new_record)
  end

  it "renders new reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rewards_path, :method => "post" do
      assert_select "input#reward_name", :name => "reward[name]"
      assert_select "input#reward_external_value", :name => "reward[external_value]"
      assert_select "input#reward_remarks", :name => "reward[remarks]"
    end
  end
end
