require "spec_helper"

describe EventRewardsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_rewards").should route_to("event_rewards#index")
    end

    it "routes to #new" do
      get("/event_rewards/new").should route_to("event_rewards#new")
    end

    it "routes to #show" do
      get("/event_rewards/1").should route_to("event_rewards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_rewards/1/edit").should route_to("event_rewards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_rewards").should route_to("event_rewards#create")
    end

    it "routes to #update" do
      put("/event_rewards/1").should route_to("event_rewards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_rewards/1").should route_to("event_rewards#destroy", :id => "1")
    end

  end
end
