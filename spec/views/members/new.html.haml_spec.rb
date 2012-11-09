require 'spec_helper'

describe "members/new" do
  before(:each) do
    assign(:member, stub_model(Member,
      :name => "MyString",
      :password => "MyString",
      :url => "MyString",
      :remarks => "MyString",
      :active => "",
    ).as_new_record)
    assign(:jobs, [stub_model(Job,
      :name => "Job",
      )]
    )
    assign(:races, [stub_model(Race,
      :name => "Race",
      )]
    )
  end

  it "renders new member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path, :method => "post" do
      assert_select "input#member_name", :name => "member[name]"
      assert_select "input#member_password", :name => "member[password]"
      assert_select "input#member_url", :name => "member[url]"
      assert_select "input#member_remarks", :name => "member[remarks]"
      assert_select "input#member_active", :name => "member[active]"
    end
  end
end
