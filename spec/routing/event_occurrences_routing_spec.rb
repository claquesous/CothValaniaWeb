require "spec_helper"

describe EventOccurrencesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_occurrences").should route_to("event_occurrences#index")
    end

    it "routes to #new" do
      get("/event_occurrences/new").should route_to("event_occurrences#new")
    end

    it "routes to #show" do
      get("/event_occurrences/1").should route_to("event_occurrences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_occurrences/1/edit").should route_to("event_occurrences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_occurrences").should route_to("event_occurrences#create")
    end

    it "routes to #update" do
      put("/event_occurrences/1").should route_to("event_occurrences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_occurrences/1").should route_to("event_occurrences#destroy", :id => "1")
    end

  end
end
