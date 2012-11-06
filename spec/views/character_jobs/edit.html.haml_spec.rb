require 'spec_helper'

describe "character_jobs/edit" do
  before(:each) do
    @character_job = assign(:character_job, stub_model(CharacterJob,
      :character => nil,
      :job => nil,
      :level => 1
    ))
  end

  it "renders the edit character_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_jobs_path(@character_job), :method => "post" do
      assert_select "input#character_job_character", :name => "character_job[character]"
      assert_select "input#character_job_job", :name => "character_job[job]"
      assert_select "input#character_job_level", :name => "character_job[level]"
    end
  end
end
