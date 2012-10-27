require 'spec_helper'

describe "requirement_obtainments/show" do
  before(:each) do
    @requirement_obtainment = assign(:requirement_obtainment, stub_model(RequirementObtainment,
      :event => nil,
      :requirement => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
