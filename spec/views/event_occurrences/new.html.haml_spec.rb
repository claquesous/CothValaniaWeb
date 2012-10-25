require 'spec_helper'

describe "event_occurrences/new" do
  before(:each) do
    assign(:event_occurrence, stub_model(EventOccurrence,
      :remarks => "MyString",
      :success => false
    ).as_new_record)
  end

  it "renders new event_occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_occurrences_path, :method => "post" do
      assert_select "input#event_occurrence_remarks", :name => "event_occurrence[remarks]"
      assert_select "input#event_occurrence_success", :name => "event_occurrence[success]"
    end
  end
end
