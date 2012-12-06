require 'spec_helper'

describe "Members" do
  describe "GET /members" do
    it "does allow a normal user" do
      login
      get members_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get members_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get members_path
      response.status.should be(200)
    end
  end
  describe "GET /members/new" do
    it "does not allow a normal user" do
      login
      get new_member_path
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get new_member_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get new_member_path
      response.status.should be(200)
    end
  end
  describe "GET /members/show" do
    before :each do
      @member = FactoryGirl.create :member
    end
    it "does allow a normal user" do
      login
      get member_path @member
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get member_path @member
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get member_path @member
      response.status.should be(200)
    end
  end
  describe "GET /members/edit" do
    before :each do
      @member = FactoryGirl.create :member
    end
    it "does not allow a normal user" do
      login
      get edit_member_path @member
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get edit_member_path @member
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get edit_member_path @member
      response.status.should be(200)
    end
  end
end

