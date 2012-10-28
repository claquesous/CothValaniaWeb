require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :name => "Name",
        :url => "Url",
        :remarks => "Remarks",
        :active => true,
        :admin => false,
        :reward_cycle => 1
      ),
      stub_model(Member,
        :name => "Name",
        :url => "Url",
        :remarks => "Remarks",
        :active => true,
        :admin => false,
        :reward_cycle => 1
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
