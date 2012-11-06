require 'spec_helper'

describe "character_jobs/show" do
  before(:each) do
    @character_job = assign(:character_job, stub_model(CharacterJob,
      :character => nil,
      :job => nil,
      :level => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
