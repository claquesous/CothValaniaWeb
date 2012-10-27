require 'spec_helper'

describe "requirement_obtainments/edit" do
  before(:each) do
    @requirement_obtainment = assign(:requirement_obtainment, stub_model(RequirementObtainment,
      :event => nil,
      :requirement => nil
    ))
  end

  it "renders the edit requirement_obtainment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requirement_obtainments_path(@requirement_obtainment), :method => "post" do
      assert_select "input#requirement_obtainment_event", :name => "requirement_obtainment[event]"
      assert_select "input#requirement_obtainment_requirement", :name => "requirement_obtainment[requirement]"
    end
  end
end
