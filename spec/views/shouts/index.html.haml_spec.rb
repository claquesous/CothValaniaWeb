require 'spec_helper'

describe "shouts/index" do
  before(:each) do
    assign(:shouts, [
      stub_model(Shout,
        :text => "MyText",
	:member => mock_model("Member", :name => "Member")
      ),
      stub_model(Shout,
        :text => "MyText",
	:member => mock_model("Member", :name => "Member")
      )
    ])
  end

  it "renders a list of shouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
