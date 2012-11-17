require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :name => "MyString",
      :password => "MyString",
      :url => "MyString",
      :remarks => "MyString",
      :active => "",
    ))
    assign(:jobs, [stub_model(Job,
      :name => "Job",
      )]
    )
    assign(:races, [stub_model(Race,
      :name => "Race",
      )]
    )
    assign(:available_rewards, [])
    assign(:selected_rewards, [])
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
    end
  end
end
