require 'spec_helper'

describe "occurrences/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Event",
    ))
    @occurrence = assign(:occurrence, stub_model(Occurrence,
      :remarks => "Remarks",
      :success => false
    ))
    params[:event_id] = @event.id
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Remarks/)
    rendered.should match(/false/)
  end
end
