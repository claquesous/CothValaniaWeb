require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :points => 1,
      :remarks => "MyString",
      :hidden => false
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_points", :name => "event[points]"
      assert_select "input#event_remarks", :name => "event[remarks]"
      assert_select "input#event_hidden", :name => "event[hidden]"
    end
  end
end
