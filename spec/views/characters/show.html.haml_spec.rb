require 'spec_helper'

describe "characters/show" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "Name",
      :remarks => "Remarks",
      :member => stub_model(Member, :name => "Member"),
      :race => stub_model(Race, :name => "Race"),
      :sex => "Male",
    ))
    @jobs = assign(:jobs, [ 
      stub_model(Job,
      :name => "Job"
      )
    ])
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Remarks/)
    rendered.should match(/Member/)
    rendered.should match(/Race/)
    rendered.should match(/Male/)
    rendered.should match(/Job/)
  end
end
