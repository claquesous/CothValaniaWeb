require "spec_helper"

describe OccurrencesController do
  describe "routing" do

    it "routes to #index" do
      get("/events/1/occurrences").should route_to("occurrences#index", :event_id => "1")
    end

    it "routes to #new" do
      get("/events/1/occurrences/new").should route_to("occurrences#new", :event_id => "1")
    end

    it "routes to #show" do
      get("/events/1/occurrences/1").should route_to("occurrences#show", :event_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/events/1/occurrences/1/edit").should route_to("occurrences#edit", :event_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/events/1/occurrences").should route_to("occurrences#create", :event_id => "1")
    end

    it "routes to #update" do
      put("/events/1/occurrences/1").should route_to("occurrences#update", :event_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/events/1/occurrences/1").should route_to("occurrences#destroy", :event_id => "1", :id => "1")
    end

  end
end
