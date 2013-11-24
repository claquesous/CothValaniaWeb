require 'spec_helper'

describe RacesController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :race }

  describe "GET index" do
    it "assigns all races as @races" do
      race = Race.create! valid_attributes
      get :index, {}
      assigns(:races).should eq([race])
    end
  end

  describe "GET show" do
    it "assigns the requested race as @race" do
      race = Race.create! valid_attributes
      get :show, {:id => race.to_param}
      assigns(:race).should eq(race)
    end
  end

  describe "GET new" do
    it "assigns a new race as @race" do
      get :new, {}
      assigns(:race).should be_a_new(Race)
    end
  end

  describe "GET edit" do
    it "assigns the requested race as @race" do
      race = Race.create! valid_attributes
      get :edit, {:id => race.to_param}
      assigns(:race).should eq(race)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:races).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Race" do
        expect {
          post :create, {:race => valid_attributes}
        }.to change(Race, :count).by(1)
      end

      it "assigns a newly created race as @race" do
        post :create, {:race => valid_attributes}
        assigns(:race).should be_a(Race)
        assigns(:race).should be_persisted
      end

      it "redirects to the created race" do
        post :create, {:race => valid_attributes}
        response.should redirect_to(Race.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved race as @race" do
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        post :create, {:race => {}}
        assigns(:race).should be_a_new(Race)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Race.stub(:new) { mock_model(Race, save: false, errors: {}) }
        post :create, {:race => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:races).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested race" do
        race = Race.create! valid_attributes
        # Assuming there are no other races in the database, this
        # specifies that the Race created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Race.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => race.to_param, :race => {'these' => 'params'}}
      end

      it "assigns the requested race as @race" do
        race = Race.create! valid_attributes
        put :update, {:id => race.to_param, :race => valid_attributes}
        assigns(:race).should eq(race)
      end

      it "redirects to the race" do
        race = Race.create! valid_attributes
        put :update, {:id => race.to_param, :race => valid_attributes}
        response.should redirect_to(race)
      end
    end

    describe "with invalid params" do
      it "assigns the race as @race" do
        race = Race.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        put :update, {:id => race.to_param, :race => {}}
        assigns(:race).should eq(race)
      end

      it "re-renders the 'edit' template" do
        race = Race.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Race.stub(:find_by_name) { mock_model(Race, update_attributes: false, errors: {}) }
        put :update, {:id => race.to_param, :race => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested race" do
      race = Race.create! valid_attributes
      expect {
        delete :destroy, {:id => race.to_param}
      }.to change(Race, :count).by(-1)
    end

    it "redirects to the races list" do
      race = Race.create! valid_attributes
      delete :destroy, {:id => race.to_param}
      response.should redirect_to(races_url)
    end
  end

end
