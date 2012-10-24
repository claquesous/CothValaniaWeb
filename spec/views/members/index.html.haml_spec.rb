require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :name => "Name",
        :password => "Password",
        :url => "Url",
        :remarks => "Remarks",
        :active => "",
        :admin => "",
        :reward_cycle => ""
      ),
      stub_model(Member,
        :name => "Name",
        :password => "Password",
        :url => "Url",
        :remarks => "Remarks",
        :active => "",
        :admin => "",
        :reward_cycle => ""
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
