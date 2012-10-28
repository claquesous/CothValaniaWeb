require 'spec_helper'

describe "characters/new" do
  before(:each) do
    assign(:character, stub_model(Character,
      :name => "MyString",
      :remarks => "MyString",
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
    ).as_new_record)
    assign(:members, ['Member'])
  end

  it "renders new character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characters_path, :method => "post" do
      assert_select "input#character_name", :name => "character[name]"
      assert_select "input#character_remarks", :name => "character[remarks]"
      assert_select "select#member", :name => "member"
      assert_select "input#character_war", :name => "character[war]"
      assert_select "input#character_mnk", :name => "character[mnk]"
      assert_select "input#character_thf", :name => "character[thf]"
      assert_select "input#character_whm", :name => "character[whm]"
      assert_select "input#character_blm", :name => "character[blm]"
      assert_select "input#character_rdm", :name => "character[rdm]"
      assert_select "input#character_pld", :name => "character[pld]"
      assert_select "input#character_drk", :name => "character[drk]"
      assert_select "input#character_bst", :name => "character[bst]"
      assert_select "input#character_brd", :name => "character[brd]"
      assert_select "input#character_rng", :name => "character[rng]"
      assert_select "input#character_sam", :name => "character[sam]"
      assert_select "input#character_nin", :name => "character[nin]"
      assert_select "input#character_drg", :name => "character[drg]"
      assert_select "input#character_smn", :name => "character[smn]"
      assert_select "input#character_blu", :name => "character[blu]"
      assert_select "input#character_cor", :name => "character[cor]"
      assert_select "input#character_pup", :name => "character[pup]"
      assert_select "input#character_dnc", :name => "character[dnc]"
      assert_select "input#character_sch", :name => "character[sch]"
    end
  end
end
