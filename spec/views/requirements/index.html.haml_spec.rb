require 'spec_helper'

describe "requirements/index" do
  before(:each) do
    assign(:requirements, [
      stub_model(Requirement,
        :name => "Mine",
        :reusable => false
      ),
      stub_model(Requirement,
        :name => "Mine",
        :reusable => false
      )
    ])
  end

  it "renders a list of requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mine".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
