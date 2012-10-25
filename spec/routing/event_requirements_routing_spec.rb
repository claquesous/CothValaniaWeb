require "spec_helper"

describe EventRequirementsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_requirements").should route_to("event_requirements#index")
    end

    it "routes to #new" do
      get("/event_requirements/new").should route_to("event_requirements#new")
    end

    it "routes to #show" do
      get("/event_requirements/1").should route_to("event_requirements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_requirements/1/edit").should route_to("event_requirements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_requirements").should route_to("event_requirements#create")
    end

    it "routes to #update" do
      put("/event_requirements/1").should route_to("event_requirements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_requirements/1").should route_to("event_requirements#destroy", :id => "1")
    end

  end
end
