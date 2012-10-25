require 'spec_helper'

describe "event_attendances/edit" do
  before(:each) do
    @event_attendance = assign(:event_attendance, stub_model(EventAttendance,
      :event_occurrence => nil,
      :character => nil
    ))
  end

  it "renders the edit event_attendance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_attendances_path(@event_attendance), :method => "post" do
      assert_select "input#event_attendance_event_occurrence", :name => "event_attendance[event_occurrence]"
      assert_select "input#event_attendance_character", :name => "event_attendance[character]"
    end
  end
end
