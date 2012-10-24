require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :name => "MyString",
      :password => "MyString",
      :url => "MyString",
      :remarks => "MyString",
      :active => "",
      :admin => "",
      :reward_cycle => ""
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path(@member), :method => "post" do
      assert_select "input#member_name", :name => "member[name]"
      assert_select "input#member_password", :name => "member[password]"
      assert_select "input#member_url", :name => "member[url]"
      assert_select "input#member_remarks", :name => "member[remarks]"
      assert_select "input#member_active", :name => "member[active]"
      assert_select "input#member_admin", :name => "member[admin]"
      assert_select "input#member_reward_cycle", :name => "member[reward_cycle]"
    end
  end
end
