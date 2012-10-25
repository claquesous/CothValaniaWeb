require 'spec_helper'

describe "event_requirements/show" do
  before(:each) do
    @event_requirement = assign(:event_requirement, stub_model(EventRequirement,
      :requirement => nil,
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
