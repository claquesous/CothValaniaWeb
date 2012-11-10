require 'spec_helper'

describe "requirements/edit" do
  before(:each) do
    @requirement = assign(:requirement, stub_model(Requirement,
      :name => "MyText",
      :reusable => false,
      :multiple => false,
    ))
    assign(:events, [stub_model(Event)])
  end

  it "renders the edit requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requirements_path(@requirement), :method => "post" do
      assert_select "input#requirement_name", :name => "requirement[name]"
      assert_select "input#requirement_reusable", :name => "requirement[reusable]"
      assert_select "input#requirement_multiple", :name => "requirement[multiple]"
    end
  end
end
