require 'spec_helper'

describe "occurrences/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Event",
    ))
    @occurrence = assign(:occurrence, stub_model(Occurrence,
      :remarks => "MyString",
      :success => false
    ))
    member = stub_model(Member)
    member.characters.build
    assign(:members, [member] )
    params[:event_id] = @event.id
  end

  it "renders the edit occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_occurrences_path(@event,@occurrence), :method => "post" do
      assert_select "input#occurrence_remarks", :name => "occurrence[remarks]"
      assert_select "input#occurrence_success", :name => "occurrence[success]"
      assert_select "input#occurrence_event_attendances_attributes_0__destroy",
        :name => "occurrence[event_attendances_attributes][0][_destroy]"
    end
  end
end
