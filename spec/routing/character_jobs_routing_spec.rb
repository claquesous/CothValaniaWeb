require "spec_helper"

describe CharacterJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/character_jobs").should route_to("character_jobs#index")
    end

    it "routes to #new" do
      get("/character_jobs/new").should route_to("character_jobs#new")
    end

    it "routes to #show" do
      get("/character_jobs/1").should route_to("character_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_jobs/1/edit").should route_to("character_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_jobs").should route_to("character_jobs#create")
    end

    it "routes to #update" do
      put("/character_jobs/1").should route_to("character_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_jobs/1").should route_to("character_jobs#destroy", :id => "1")
    end

  end
end
