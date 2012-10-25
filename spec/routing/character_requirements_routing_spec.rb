require "spec_helper"

describe CharacterRequirementsController do
  describe "routing" do

    it "routes to #index" do
      get("/character_requirements").should route_to("character_requirements#index")
    end

    it "routes to #new" do
      get("/character_requirements/new").should route_to("character_requirements#new")
    end

    it "routes to #show" do
      get("/character_requirements/1").should route_to("character_requirements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_requirements/1/edit").should route_to("character_requirements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_requirements").should route_to("character_requirements#create")
    end

    it "routes to #update" do
      put("/character_requirements/1").should route_to("character_requirements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_requirements/1").should route_to("character_requirements#destroy", :id => "1")
    end

  end
end
