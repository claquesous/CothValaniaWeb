require 'spec_helper'

describe "characters/index" do
  before(:each) do
    assign(:characters, [
      stub_model(Character,
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
        :sch => false
      ),
      stub_model(Character,
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
        :sch => false
      )
    ])
  end

  it "renders a list of characters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
