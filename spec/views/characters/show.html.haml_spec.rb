require 'spec_helper'

describe "characters/show" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "Name",
      :remarks => "Remarks",
      :war => false,
      :mnk => false,
      :thf => false,
      :whm => false,
      :blm => false,
      :rdm => false,
      :pld => false,
      :drk => false,
      :bst => false,
      :brd => false,
      :rng => false,
      :sam => false,
      :nin => false,
      :drg => false,
      :smn => false,
      :blu => false,
      :cor => false,
      :pup => false,
      :dnc => false,
      :sch => false,
      :member => stub_model(Member, :name => "Member"),
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Remarks/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Member/)
  end
end
