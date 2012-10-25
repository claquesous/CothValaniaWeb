require 'spec_helper'

describe "requirement_attainments/show" do
  before(:each) do
    @requirement_attainment = assign(:requirement_attainment, stub_model(RequirementAttainment,
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
