require 'spec_helper'

describe "event_occurrences/edit" do
  before(:each) do
    @event_occurrence = assign(:event_occurrence, stub_model(EventOccurrence,
      :remarks => "MyString",
      :success => false
    ))
  end

  it "renders the edit event_occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_occurrences_path(@event_occurrence), :method => "post" do
      assert_select "input#event_occurrence_remarks", :name => "event_occurrence[remarks]"
      assert_select "input#event_occurrence_success", :name => "event_occurrence[success]"
    end
  end
end
