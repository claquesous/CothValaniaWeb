require 'spec_helper'

describe RequirementsController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :requirement }

  describe "GET index" do
    it "assigns all requirements as @requirements" do
      requirement = Requirement.create! valid_attributes
      get :index, {}
      assigns(:requirements).should eq([requirement])
    end
  end

  describe "GET show" do
    it "assigns the requested requirement as @requirement" do
      requirement = Requirement.create! valid_attributes
      get :show, {:id => requirement.to_param}
      assigns(:requirement).should eq(requirement)
    end
  end

  describe "GET new" do
    it "assigns a new requirement as @requirement" do
      get :new, {}
      assigns(:requirement).should be_a_new(Requirement)
    end
  end

  describe "GET edit" do
    it "assigns the requested requirement as @requirement" do
      requirement = Requirement.create! valid_attributes
      get :edit, {:id => requirement.to_param}
      assigns(:requirement).should eq(requirement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:requirements).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Requirement" do
        expect {
          post :create, {:requirement => valid_attributes}
        }.to change(Requirement, :count).by(1)
      end

      it "assigns a newly created requirement as @requirement" do
        post :create, {:requirement => valid_attributes}
        assigns(:requirement).should be_a(Requirement)
        assigns(:requirement).should be_persisted
      end

      it "redirects to the created requirement" do
        post :create, {:requirement => valid_attributes}
        response.should redirect_to(Requirement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved requirement as @requirement" do
        # Trigger the behavior that occurs when invalid params are submitted
        Requirement.any_instance.stub(:save).and_return(false)
        post :create, {:requirement => {}}
        assigns(:requirement).should be_a_new(Requirement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Requirement.stub(:new) { mock_model(Requirement, save: false, errors: {}, build_all_event_requirements: [], build_all_requirement_obtainments: []) }
        post :create, {:requirement => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:requirements).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested requirement" do
        requirement = Requirement.create! valid_attributes
        # Assuming there are no other requirements in the database, this
        # specifies that the Requirement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Requirement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => requirement.to_param, :requirement => {'these' => 'params'}}
      end

      it "assigns the requested requirement as @requirement" do
        requirement = Requirement.create! valid_attributes
        put :update, {:id => requirement.to_param, :requirement => valid_attributes}
        assigns(:requirement).should eq(requirement)
      end

      it "redirects to the requirement" do
        requirement = Requirement.create! valid_attributes
        put :update, {:id => requirement.to_param, :requirement => valid_attributes}
        response.should redirect_to(requirement)
      end
    end

    describe "with invalid params" do
      it "assigns the requirement as @requirement" do
        requirement = Requirement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Requirement.any_instance.stub(:save).and_return(false)
        put :update, {:id => requirement.to_param, :requirement => {}}
        assigns(:requirement).should eq(requirement)
      end

      it "re-renders the 'edit' template" do
        requirement = Requirement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Requirement.stub(:find_by_name) { mock_model(Requirement, update_attributes: false, errors: {}, build_all_event_requirements: [], build_all_requirement_obtainments: []) }
        put :update, {:id => requirement.to_param, :requirement => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested requirement" do
      requirement = Requirement.create! valid_attributes
      expect {
        delete :destroy, {:id => requirement.to_param}
      }.to change(Requirement, :count).by(-1)
    end

    it "redirects to the requirements list" do
      requirement = Requirement.create! valid_attributes
      delete :destroy, {:id => requirement.to_param}
      response.should redirect_to(requirements_url)
    end
  end

end
