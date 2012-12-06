require 'spec_helper'

describe "Rewards" do
  describe "GET /rewards" do
    it "does allow a normal user" do
      login
      get rewards_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get rewards_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get rewards_path
      response.status.should be(200)
    end
  end
  describe "GET /rewards/new" do
    it "does not allow a normal user" do
      login
      get new_reward_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get new_reward_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get new_reward_path
      response.status.should be(200)
    end
  end
  describe "GET /rewards/show" do
    before :each do
      @reward = FactoryGirl.create :reward
    end
    it "does allow a normal user" do
      login
      get reward_path @reward
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get reward_path @reward
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get reward_path @reward
      response.status.should be(200)
    end
  end
  describe "GET /rewards/edit" do
    before :each do
      @reward = FactoryGirl.create :reward
    end
    it "does not allow a normal user" do
      login
      get edit_reward_path @reward
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_reward_path @reward
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_reward_path @reward
      response.status.should be(200)
    end
  end
end

