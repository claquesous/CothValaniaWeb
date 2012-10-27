require 'spec_helper'

describe "requirement_obtainments/index" do
  before(:each) do
    assign(:requirement_obtainments, [
      stub_model(RequirementObtainment,
        :event => nil,
        :requirement => nil
      ),
      stub_model(RequirementObtainment,
        :event => nil,
        :requirement => nil
      )
    ])
  end

  it "renders a list of requirement_obtainments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
