require "spec_helper"

describe EventAttendancesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_attendances").should route_to("event_attendances#index")
    end

    it "routes to #new" do
      get("/event_attendances/new").should route_to("event_attendances#new")
    end

    it "routes to #show" do
      get("/event_attendances/1").should route_to("event_attendances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_attendances/1/edit").should route_to("event_attendances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_attendances").should route_to("event_attendances#create")
    end

    it "routes to #update" do
      put("/event_attendances/1").should route_to("event_attendances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_attendances/1").should route_to("event_attendances#destroy", :id => "1")
    end

  end
end
