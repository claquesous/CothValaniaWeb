require 'spec_helper'

describe "shouts/show" do
  before(:each) do
    @shout = assign(:shout, stub_model(Shout,
      :text => "MyText",
      :member => mock_model("Member", :name => "Member")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
