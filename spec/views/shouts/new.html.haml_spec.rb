require 'spec_helper'

describe "shouts/new" do
  before(:each) do
    assign(:shout, stub_model(Shout,
      :text => "MyText",
      :character => nil
    ).as_new_record)
  end

  it "renders new shout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shouts_path, :method => "post" do
      assert_select "textarea#shout_text", :name => "shout[text]"
      assert_select "input#shout_character", :name => "shout[character]"
    end
  end
end
