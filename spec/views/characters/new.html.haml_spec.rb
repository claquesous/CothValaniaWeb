require 'spec_helper'

describe "characters/new" do
  before(:each) do
    assign(:character, stub_model(Character,
      :name => "MyString",
      :remarks => "MyString",
      :sex => "Male"
    ).as_new_record)
    assign(:members, ["Member"])
    assign(:races, ["Race"])
    assign(:jobs, ["Job"])
  end

  it "renders new character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characters_path, :method => "post" do
      assert_select "input#character_name", :name => "character[name]"
      assert_select "input#character_remarks", :name => "character[remarks]"
      assert_select "select#member", :name => "member"
      assert_select "input#race_Race", :name => "race"
      assert_select "input#character_sex_male", :name => "character[sex]"
    end
  end
end
