require 'spec_helper'

describe "requirement_attainments/new" do
  before(:each) do
    assign(:requirement_attainment, stub_model(RequirementAttainment,
      :event => nil,
      :requirement => nil
    ).as_new_record)
  end

  it "renders new requirement_attainment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requirement_attainments_path, :method => "post" do
      assert_select "input#requirement_attainment_event", :name => "requirement_attainment[event]"
      assert_select "input#requirement_attainment_requirement", :name => "requirement_attainment[requirement]"
    end
  end
end
