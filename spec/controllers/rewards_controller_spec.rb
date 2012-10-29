require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RewardsController do

  # This should return the minimal set of attributes required to create a valid
  # Reward. As you add validations to Reward, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => 'Reward'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RewardsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before :each do
    controller.stub!(:require_login).and_return(:true)
  end

  describe "GET index" do
    it "assigns all rewards as @rewards" do
      reward = Reward.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rewards).should eq([reward])
    end
  end

  describe "GET show" do
    it "assigns the requested reward as @reward" do
      reward = Reward.create! valid_attributes
      get :show, {:id => reward.to_param}, valid_session
      assigns(:reward).should eq(reward)
    end
  end

  describe "GET new" do
    it "assigns a new reward as @reward" do
      get :new, {}, valid_session
      assigns(:reward).should be_a_new(Reward)
    end
  end

  describe "GET edit" do
    it "assigns the requested reward as @reward" do
      reward = Reward.create! valid_attributes
      get :edit, {:id => reward.to_param}, valid_session
      assigns(:reward).should eq(reward)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reward" do
        expect {
          post :create, {:reward => valid_attributes}, valid_session
        }.to change(Reward, :count).by(1)
      end

      it "assigns a newly created reward as @reward" do
        post :create, {:reward => valid_attributes}, valid_session
        assigns(:reward).should be_a(Reward)
        assigns(:reward).should be_persisted
      end

      it "redirects to the created reward" do
        post :create, {:reward => valid_attributes}, valid_session
        response.should redirect_to(Reward.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reward as @reward" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        post :create, {:reward => {}}, valid_session
        assigns(:reward).should be_a_new(Reward)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        post :create, {:reward => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reward" do
        reward = Reward.create! valid_attributes
        # Assuming there are no other rewards in the database, this
        # specifies that the Reward created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reward.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => reward.to_param, :reward => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested reward as @reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}, valid_session
        assigns(:reward).should eq(reward)
      end

      it "redirects to the reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}, valid_session
        response.should redirect_to(reward)
      end
    end

    describe "with invalid params" do
      it "assigns the reward as @reward" do
        reward = Reward.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        put :update, {:id => reward.to_param, :reward => {}}, valid_session
        assigns(:reward).should eq(reward)
      end

      it "re-renders the 'edit' template" do
        reward = Reward.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reward.any_instance.stub(:save).and_return(false)
        put :update, {:id => reward.to_param, :reward => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reward" do
      reward = Reward.create! valid_attributes
      expect {
        delete :destroy, {:id => reward.to_param}, valid_session
      }.to change(Reward, :count).by(-1)
    end

    it "redirects to the rewards list" do
      reward = Reward.create! valid_attributes
      delete :destroy, {:id => reward.to_param}, valid_session
      response.should redirect_to(rewards_url)
    end
  end

end
