require "spec_helper"

describe RequirementObtainmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/requirement_obtainments").should route_to("requirement_obtainments#index")
    end

    it "routes to #new" do
      get("/requirement_obtainments/new").should route_to("requirement_obtainments#new")
    end

    it "routes to #show" do
      get("/requirement_obtainments/1").should route_to("requirement_obtainments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/requirement_obtainments/1/edit").should route_to("requirement_obtainments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/requirement_obtainments").should route_to("requirement_obtainments#create")
    end

    it "routes to #update" do
      put("/requirement_obtainments/1").should route_to("requirement_obtainments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/requirement_obtainments/1").should route_to("requirement_obtainments#destroy", :id => "1")
    end

  end
end
