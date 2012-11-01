require 'spec_helper'

describe "event_occurrences/index" do
  before(:each) do
    assign(:event_occurrences, [
      stub_model(EventOccurrence,
        :remarks => "Remarks",
        :success => false,
	:event => mock_model("Event", :name => "Event")
      ),
      stub_model(EventOccurrence,
        :remarks => "Remarks",
        :success => false,
	:event => mock_model("Event", :name => "Event")
      )
    ])
  end

  it "renders a list of event_occurrences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
  end
end
