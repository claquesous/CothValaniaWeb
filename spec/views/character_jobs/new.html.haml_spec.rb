require 'spec_helper'

describe "character_jobs/new" do
  before(:each) do
    assign(:character_job, stub_model(CharacterJob,
      :character => nil,
      :job => nil,
      :level => 1
    ).as_new_record)
  end

  it "renders new character_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_jobs_path, :method => "post" do
      assert_select "input#character_job_character", :name => "character_job[character]"
      assert_select "input#character_job_job", :name => "character_job[job]"
      assert_select "input#character_job_level", :name => "character_job[level]"
    end
  end
end
