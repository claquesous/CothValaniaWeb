require 'spec_helper'

describe "event_occurrences/new" do
  before(:each) do
    assign(:event_occurrence, stub_model(EventOccurrence,
      :remarks => "MyString",
      :success => false
    ).as_new_record)
    assign(:events, ["Event","Other Event"])
    member = stub_model(Member)
    member.characters.build
    assign(:members, [member] )
  end

  it "renders new event_occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_occurrences_path, :method => "post" do
      assert_select "input#event_occurrence_remarks", :name => "event_occurrence[remarks]"
      assert_select "input#event_occurrence_success", :name => "event_occurrence[success]"
      assert_select "input#event_occurrence_event_attendances_attributes_0__destroy",
        :name => "event_occurrence[event_attendances_attributes][0][_destroy]"
    end
  end
end
