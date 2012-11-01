require 'spec_helper'

describe "shouts/edit" do
  before(:each) do
    @shout = assign(:shout, stub_model(Shout,
      :text => "MyText",
    ))
  end

  it "renders the edit shout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shouts_path(@shout), :method => "post" do
      assert_select "textarea#shout_text", :name => "shout[text]"
    end
  end
end
