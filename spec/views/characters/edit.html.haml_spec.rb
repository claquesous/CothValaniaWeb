require 'spec_helper'

describe "characters/edit" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "MyString",
      :remarks => "MyString",
      :sex => "Male",
    ))
    @members = assign(:members, ["Member"])
    @races = assign(:races, ["Race"])
    @jobs = assign(:jobs, ["Job"])
  end

  it "renders the edit character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characters_path(@character), :method => "post" do
      assert_select "input#character_name", :name => "character[name]"
      assert_select "input#character_remarks", :name => "character[remarks]"
      assert_select "select#member", :name => "member"
      assert_select "input#race_Race", :name => "race"
      assert_select "input#character_sex_male", :name => "character[sex]"
    end
  end
end
