require 'spec_helper'

describe "requirements/show" do
  before(:each) do
    @requirement = assign(:requirement, stub_model(Requirement,
      :name => "MyText",
      :reusable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
