require "spec_helper"

describe RequirementAttainmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/requirement_attainments").should route_to("requirement_attainments#index")
    end

    it "routes to #new" do
      get("/requirement_attainments/new").should route_to("requirement_attainments#new")
    end

    it "routes to #show" do
      get("/requirement_attainments/1").should route_to("requirement_attainments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/requirement_attainments/1/edit").should route_to("requirement_attainments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/requirement_attainments").should route_to("requirement_attainments#create")
    end

    it "routes to #update" do
      put("/requirement_attainments/1").should route_to("requirement_attainments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/requirement_attainments/1").should route_to("requirement_attainments#destroy", :id => "1")
    end

  end
end
