require 'spec_helper'

describe "shouts/show" do
  before(:each) do
    @shout = assign(:shout, stub_model(Shout,
      :text => "MyText",
      :character => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
