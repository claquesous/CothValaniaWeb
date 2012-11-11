require 'spec_helper'

describe "occurrences/index" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Event",
    ))
    assign(:occurrences, [
      stub_model(Occurrence,
        :remarks => "Remarks",
        :success => false,
	:event => mock_model("Event", :name => "Event")
      ),
      stub_model(Occurrence,
        :remarks => "Remarks",
        :success => false,
	:event => mock_model("Event", :name => "Event")
      )
    ])
    params[:event_id] = @event.id
  end

  it "renders a list of occurrences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
  end
end
