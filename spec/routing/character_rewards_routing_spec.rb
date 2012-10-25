require "spec_helper"

describe CharacterRewardsController do
  describe "routing" do

    it "routes to #index" do
      get("/character_rewards").should route_to("character_rewards#index")
    end

    it "routes to #new" do
      get("/character_rewards/new").should route_to("character_rewards#new")
    end

    it "routes to #show" do
      get("/character_rewards/1").should route_to("character_rewards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_rewards/1/edit").should route_to("character_rewards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_rewards").should route_to("character_rewards#create")
    end

    it "routes to #update" do
      put("/character_rewards/1").should route_to("character_rewards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_rewards/1").should route_to("character_rewards#destroy", :id => "1")
    end

  end
end
