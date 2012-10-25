require 'spec_helper'

describe "event_occurrences/show" do
  before(:each) do
    @event_occurrence = assign(:event_occurrence, stub_model(EventOccurrence,
      :remarks => "Remarks",
      :success => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Remarks/)
    rendered.should match(/false/)
  end
end
