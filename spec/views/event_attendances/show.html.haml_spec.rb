require 'spec_helper'

describe "event_attendances/show" do
  before(:each) do
    @event_attendance = assign(:event_attendance, stub_model(EventAttendance,
      :event_occurrence => nil,
      :character => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
