require 'spec_helper'

describe "Jobs" do
  describe "GET /requirements" do
    it "does not allow a normal user" do
      login
      get requirements_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get requirements_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get requirements_path
      response.status.should be(200)
    end
  end
  describe "GET /requirements/new" do
    it "does not allow a normal user" do
      login
      get new_requirement_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get new_requirement_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get new_requirement_path
      response.status.should be(200)
    end
  end
  describe "GET /requirements/show" do
    before :each do
      @requirement = FactoryGirl.create :requirement
    end
    it "does not allow a normal user" do
      login
      get requirement_path @requirement
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get requirement_path @requirement
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get requirement_path @requirement
      response.status.should be(200)
    end
  end
  describe "GET /requirements/edit" do
    before :each do
      @requirement = FactoryGirl.create :requirement
    end
    it "does not allow a normal user" do
      login
      get edit_requirement_path @requirement
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_requirement_path @requirement
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_requirement_path @requirement
      response.status.should be(200)
    end
  end
end

