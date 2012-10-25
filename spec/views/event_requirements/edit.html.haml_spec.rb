require 'spec_helper'

describe "event_requirements/edit" do
  before(:each) do
    @event_requirement = assign(:event_requirement, stub_model(EventRequirement,
      :requirement => nil,
      :event => nil
    ))
  end

  it "renders the edit event_requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_requirements_path(@event_requirement), :method => "post" do
      assert_select "input#event_requirement_requirement", :name => "event_requirement[requirement]"
      assert_select "input#event_requirement_event", :name => "event_requirement[event]"
    end
  end
end
