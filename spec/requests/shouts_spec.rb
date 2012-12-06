require 'spec_helper'

describe "Shouts" do
  describe "GET /shouts" do
    it "does allow a normal user" do
      login
      get shouts_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get shouts_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get shouts_path
      response.status.should be(200)
    end
  end
  describe "GET /shouts/new" do
    it "does allow a normal user" do
      login
      get new_shout_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get new_shout_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get new_shout_path
      response.status.should be(200)
    end
  end
  describe "GET /shouts/show" do
    before :each do
      @shout = FactoryGirl.create :shout
    end
    it "does allow a normal user" do
      login
      get shout_path @shout
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get shout_path @shout
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get shout_path @shout
      response.status.should be(200)
    end
  end
  describe "GET /shouts/edit" do
    before :each do
      @shout = FactoryGirl.create :shout
    end
    it "does not allow a normal user" do
      login
      get edit_shout_path @shout
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get edit_shout_path @shout
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get edit_shout_path @shout
      response.status.should be(200)
    end
  end
end

