require 'spec_helper'

describe ShoutsController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :shout }

  before :each do
    controller.stub(:current_member).and_return(mock_model("Member"))
  end

  describe "GET index" do
    it "assigns all shouts as @shouts" do
      shout = FactoryGirl.create(:shout)
      get :index, {}
      assigns(:shouts).should eq([shout])
    end
  end

  describe "GET show" do
    it "assigns the requested shout as @shout" do
      shout = FactoryGirl.create(:shout)
      get :show, {:id => shout.to_param}
      assigns(:shout).should eq(shout)
    end
  end

  describe "GET new" do
    it "assigns a new shout as @shout" do
      get :new, {}
      assigns(:shout).should be_a_new(Shout)
    end
  end

  describe "GET edit" do
    it "assigns the requested shout as @shout" do
      shout = FactoryGirl.create(:shout)
      get :edit, {:id => shout.to_param}
      assigns(:shout).should eq(shout)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Shout" do
        expect {
          post :create, {:shout => valid_attributes}
        }.to change(Shout, :count).by(1)
      end

      it "assigns a newly created shout as @shout" do
        post :create, {:shout => valid_attributes}
        assigns(:shout).should be_a(Shout)
        assigns(:shout).should be_persisted
      end

      it "redirects to the created shout" do
        post :create, {:shout => valid_attributes}
        response.should redirect_to(Shout.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shout as @shout" do
        # Trigger the behavior that occurs when invalid params are submitted
        Shout.any_instance.stub(:save).and_return(false)
        post :create, {:shout => {}}
        assigns(:shout).should be_a_new(Shout)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Shout.stub(:new) { mock_model(Shout, save: false, errors: {}, :member= => true) }
        post :create, {:shout => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shout" do
        shout = FactoryGirl.create(:shout)
        # Assuming there are no other shouts in the database, this
        # specifies that the Shout created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Shout.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => shout.to_param, :shout => {'these' => 'params'}}
      end

      it "assigns the requested shout as @shout" do
        shout = FactoryGirl.create(:shout)
        put :update, {:id => shout.to_param, :shout => valid_attributes}
        assigns(:shout).should eq(shout)
      end

      it "redirects to the shout" do
        shout = FactoryGirl.create(:shout)
        put :update, {:id => shout.to_param, :shout => valid_attributes}
        response.should redirect_to(shout)
      end
    end

    describe "with invalid params" do
      it "assigns the shout as @shout" do
        shout = FactoryGirl.create(:shout)
        # Trigger the behavior that occurs when invalid params are submitted
        Shout.any_instance.stub(:save).and_return(false)
        put :update, {:id => shout.to_param, :shout => {}}
        assigns(:shout).should eq(shout)
      end

      it "re-renders the 'edit' template" do
        shout = FactoryGirl.create(:shout)
        # Trigger the behavior that occurs when invalid params are submitted
        Shout.stub(:find) { mock_model(Shout, update_attributes: false, errors: {}) }
        put :update, {:id => shout.to_param, :shout => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shout" do
      shout = FactoryGirl.create(:shout)
      expect {
        delete :destroy, {:id => shout.to_param}
      }.to change(Shout, :count).by(-1)
    end

    it "redirects to the shouts list" do
      shout = FactoryGirl.create(:shout)
      delete :destroy, {:id => shout.to_param}
      response.should redirect_to(shouts_url)
    end
  end

end
