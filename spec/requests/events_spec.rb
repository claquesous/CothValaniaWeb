require 'spec_helper'

describe "Events" do
  describe "GET /events" do
    it "does allow a normal user" do
      login
      get events_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get events_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get events_path
      response.status.should be(200)
    end
  end
  describe "GET /events/new" do
    it "does not allow a normal user" do
      login
      get new_event_path
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get new_event_path
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get new_event_path
      response.status.should be(200)
    end
  end
  describe "GET /events/show" do
    before :each do
      @event = FactoryGirl.create :event
    end
    it "does allow a normal user" do
      login
      get event_path @event
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get event_path @event
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get event_path @event
      response.status.should be(200)
    end
  end
  describe "GET /events/edit" do
    before :each do
      @event = FactoryGirl.create :event
    end
    it "does not allow a normal user" do
      login
      get edit_event_path @event
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_event_path @event
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_event_path @event
      response.status.should be(200)
    end
  end
end

