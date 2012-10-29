require 'spec_helper'

describe "RequirementObtainments" do
  before :each do
    login
  end

  describe "GET /requirement_obtainments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get requirement_obtainments_path
      response.status.should be(200)
    end
  end
end
