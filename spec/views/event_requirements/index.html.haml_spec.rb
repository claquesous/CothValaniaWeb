require 'spec_helper'

describe "event_requirements/index" do
  before(:each) do
    assign(:event_requirements, [
      stub_model(EventRequirement,
        :requirement => nil,
        :event => nil
      ),
      stub_model(EventRequirement,
        :requirement => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of event_requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
