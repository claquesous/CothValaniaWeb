require 'spec_helper'

describe "RequirementAttainments" do
  describe "GET /requirement_attainments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get requirement_attainments_path
      response.status.should be(200)
    end
  end
end
