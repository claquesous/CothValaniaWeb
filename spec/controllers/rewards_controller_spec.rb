require 'spec_helper'

describe RewardsController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :reward }

  describe "GET index" do
    it "assigns all rewards as @rewards" do
      reward = Reward.create! valid_attributes
      get :index, {}
      assigns(:rewards).should eq([reward])
    end
  end

  describe "GET show" do
    it "assigns the requested reward as @reward" do
      reward = Reward.create! valid_attributes
      get :show, {:id => reward.to_param}
      assigns(:reward).should eq(reward)
    end
  end

  describe "GET new" do
    it "assigns a new reward as @reward" do
      get :new, {}
      assigns(:reward).should be_a_new(Reward)
    end
  end

  describe "GET edit" do
    it "assigns the requested reward as @reward" do
      reward = Reward.create! valid_attributes
      get :edit, {:id => reward.to_param}
      assigns(:reward).should eq(reward)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:rewards).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Reward" do
        expect {
          post :create, {:reward => valid_attributes}
        }.to change(Reward, :count).by(1)
      end

      it "assigns a newly created reward as @reward" do
        post :create, {:reward => valid_attributes}
        assigns(:reward).should be_a(Reward)
        assigns(:reward).should be_persisted
      end

      it "redirects to the created reward" do
        post :create, {:reward => valid_attributes}
        response.should redirect_to(Reward.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reward as @reward" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        post :create, {:reward => {}}
        assigns(:reward).should be_a_new(Reward)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.stub(:new) { mock_model(Reward, save: false, errors: {}, build_all_event_rewards: []) }
        post :create, {:reward => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:rewards).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested reward" do
        reward = Reward.create! valid_attributes
        # Assuming there are no other rewards in the database, this
        # specifies that the Reward created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reward.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => reward.to_param, :reward => {'these' => 'params'}}
      end

      it "assigns the requested reward as @reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}
        assigns(:reward).should eq(reward)
      end

      it "redirects to the reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}
        response.should redirect_to(reward)
      end
    end

    describe "with invalid params" do
      it "assigns the reward as @reward" do
        reward = Reward.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        put :update, {:id => reward.to_param, :reward => {}}
        assigns(:reward).should eq(reward)
      end

      it "re-renders the 'edit' template" do
        reward = Reward.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.stub(:find_by_name) { mock_model(Reward, update_attributes: false, errors: {}, build_all_event_rewards: []) }
        put :update, {:id => reward.to_param, :reward => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reward" do
      reward = Reward.create! valid_attributes
      expect {
        delete :destroy, {:id => reward.to_param}
      }.to change(Reward, :count).by(-1)
    end

    it "redirects to the rewards list" do
      reward = Reward.create! valid_attributes
      delete :destroy, {:id => reward.to_param}
      response.should redirect_to(rewards_url)
    end
  end

end
