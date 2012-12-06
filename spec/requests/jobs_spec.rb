require 'spec_helper'

describe "Jobs" do
  describe "GET /jobs" do
    it "does not allow a normal user" do
      login
      get jobs_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get jobs_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get jobs_path
      response.status.should be(200)
    end
  end
  describe "GET /jobs/new" do
    it "does not allow a normal user" do
      login
      get new_job_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get new_job_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get new_job_path
      response.status.should be(200)
    end
  end
  describe "GET /jobs/show" do
    before :each do
      @job = FactoryGirl.create :job
    end
    it "does not allow a normal user" do
      login
      get job_path @job
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get job_path @job
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get job_path @job
      response.status.should be(200)
    end
  end
  describe "GET /jobs/edit" do
    before :each do
      @job = FactoryGirl.create :job
    end
    it "does not allow a normal user" do
      login
      get edit_job_path @job
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_job_path @job
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_job_path @job
      response.status.should be(200)
    end
  end
end

