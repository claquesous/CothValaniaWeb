require 'spec_helper'

describe "event_requirements/new" do
  before(:each) do
    assign(:event_requirement, stub_model(EventRequirement,
      :requirement => nil,
      :event => nil
    ).as_new_record)
  end

  it "renders new event_requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_requirements_path, :method => "post" do
      assert_select "input#event_requirement_requirement", :name => "event_requirement[requirement]"
      assert_select "input#event_requirement_event", :name => "event_requirement[event]"
    end
  end
end
