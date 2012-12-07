require 'spec_helper'

describe "Occurrences" do
  before :each do
    @event = FactoryGirl.create :event
  end

  describe "GET /occurrences" do
    it "does allow a normal user" do
      login
      get event_occurrences_path @event
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get event_occurrences_path @event
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get event_occurrences_path @event
      response.status.should be(200)
    end
  end
  describe "GET /occurrences/new" do
    it "does not allow a normal user" do
      login
      get new_event_occurrence_path @event
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get new_event_occurrence_path @event
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get new_event_occurrence_path @event
      response.status.should be(200)
    end
  end
  describe "GET /occurrences/show" do
    before :each do
      @occurrence = FactoryGirl.create :occurrence
      Occurrence.any_instance.stub(:member).and_return(mock_model("Member", name: "Member"))
    end
    it "does allow a normal user" do
      login
      get event_occurrence_path @event, @occurrence
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get event_occurrence_path @event, @occurrence
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get event_occurrence_path @event, @occurrence
      response.status.should be(200)
    end
  end
  describe "GET /occurrences/edit" do
    before :each do
      @occurrence = FactoryGirl.create :occurrence
    end
    it "does not allow a normal user" do
      login
      get edit_event_occurrence_path @event, @occurrence
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get edit_event_occurrence_path @event, @occurrence
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get edit_event_occurrence_path @event, @occurrence
      response.status.should be(200)
    end
  end
end

