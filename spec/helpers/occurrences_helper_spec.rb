require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the OccurrencesHelper. For example:
#
# describe OccurrencesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe OccurrencesHelper do
  before :each do
    @occurrence = stub_model(Occurrence)
    @character = stub_model(Character)
  end

  describe "get requirements" do
    it "should give nothing if there are no matches" do
      requirements = [stub_model(CharacterRequirement),
        stub_model(CharacterRequirement)
      ]
      get_requirements(requirements,@character).should eq(nil)
    end

    it "should give a used character_requirement matching occurrence" do
      unused = stub_model(CharacterRequirement,
        :character => @character,
        :used_occurrence => nil,
      )
      match =  stub_model(CharacterRequirement,
        :character => @character,
        :used_occurrence => @occurrence,
      )
      requirements = [unused, match]
      get_requirements(requirements,@character).should eq(match)
    end

    it "should give an unused character_requirement" do
      unused = stub_model(CharacterRequirement,
        :character => @character,
        :used_occurrence => nil,
      )
      mismatch =  stub_model(CharacterRequirement,
        :character => stub_model(Character),
        :used_occurrence => nil,
      )
      requirements = [unused, mismatch]
      get_requirements(requirements,@character).should eq(unused)
    end
  end
end
