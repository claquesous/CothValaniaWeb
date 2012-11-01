require 'spec_helper'

describe "event_attendances/index" do
  before(:each) do
    assign(:event_attendances, [
      stub_model(EventAttendance,
        :event_occurrence => nil,
        :character => mock_model("Character", :name => "Character")
      ),
      stub_model(EventAttendance,
        :event_occurrence => nil,
        :character => mock_model("Character", :name => "Character")
      )
    ])
  end

  it "renders a list of event_attendances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Character".to_s, :count => 2
  end
end
