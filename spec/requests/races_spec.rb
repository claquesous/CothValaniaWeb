require 'spec_helper'

describe "Jobs" do
  describe "GET /races" do
    it "does not allow a normal user" do
      login
      get races_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get races_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get races_path
      response.status.should be(200)
    end
  end
  describe "GET /races/new" do
    it "does not allow a normal user" do
      login
      get new_race_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get new_race_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get new_race_path
      response.status.should be(200)
    end
  end
  describe "GET /races/show" do
    before :each do
      @race = FactoryGirl.create :race
    end
    it "does not allow a normal user" do
      login
      get race_path @race
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get race_path @race
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get race_path @race
      response.status.should be(200)
    end
  end
  describe "GET /races/edit" do
    before :each do
      @race = FactoryGirl.create :race
    end
    it "does not allow a normal user" do
      login
      get edit_race_path @race
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_race_path @race
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_race_path @race
      response.status.should be(200)
    end
  end
end

