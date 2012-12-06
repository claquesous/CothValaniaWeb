require 'spec_helper'

describe "Home" do
  describe "GET /" do
    it "does allow a normal user" do
      login
      get home_index_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get home_index_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get home_index_path
      response.status.should be(200)
    end
  end
end
