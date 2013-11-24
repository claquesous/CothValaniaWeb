require 'spec_helper'

describe MembersController, logged_in: true do
  def valid_attributes
    {
      :name => "Cvweb",
      :password => "pass",
      :characters_attributes => {"0" => {:name => "Cvweb"}},
    }
  end

  before :each do
    controller.stub(:validate_member).and_return(:true)
    Member.any_instance.stub(:set_rewards)
  end

  describe "GET index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, {}
      assigns(:members).should eq([member])
    end

    it "assigns only active members normally" do
      member = FactoryGirl.create :member
      inactive = FactoryGirl.create :member, active: false
      get :index, {}
      assigns(:members).should eq([member])
    end

    it "assigns all members when passing update_active" do
      member = FactoryGirl.create :member
      inactive = FactoryGirl.create :member, active: false
      get :index, {update_active: true }
      assigns(:members).should eq([member, inactive])
    end

    it "assigns only active members normally when passing update_admins" do
      member = FactoryGirl.create :member
      inactive = FactoryGirl.create :member, active: false
      get :index, {update_admins: true}
      assigns(:members).should eq([member])
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, {:id => member.to_param}
      assigns(:member).should eq(member)
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, {}
      assigns(:member).should be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      controller.stub(:current_member).and_return(member)
      get :edit, {:id => member.to_param}
      assigns(:member).should eq(member)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:members).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Member" do
        expect {
          post :create, {:member => valid_attributes, :reward_preferences => "" }
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, {:member => valid_attributes, :reward_preferences => "" }
        assigns(:member).should be_a(Member)
        assigns(:member).should be_persisted
      end

      it "redirects to the created member" do
        post :create, {:member => valid_attributes, :reward_preferences => "" }
        response.should redirect_to(Member.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        post :create, {:member => {}, :reward_preferences => "" }
        assigns(:member).should be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.stub(:new) { mock_model(Member, save: false, errors: {}, characters: [mock_model(Character)], build_all_character_jobs: []) }
        post :create, {:member => {}, :reward_preferences => "" }
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:members).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested member" do
        member = Member.create! valid_attributes
        # Assuming there are no other members in the database, this
        # specifies that the Member created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Member.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => member.to_param, :member => {'these' => 'params'}, :reward_preferences => "" }
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        attributes = valid_attributes
        attributes[:characters_attributes]["0"][:id] = member.characters.first.id
        put :update, {:id => member.to_param, :member => attributes, :reward_preferences => "" }
        assigns(:member).should eq(member)
      end

      it "redirects to the member" do
        member = Member.create! valid_attributes
        attributes = valid_attributes
        attributes[:characters_attributes]["0"][:id] = member.characters.first.id
        put :update, {:id => member.to_param, :member => attributes, :reward_preferences => "" }
        response.should redirect_to(member)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        put :update, {:id => member.to_param, :member => {}, :reward_preferences => "" }
        assigns(:member).should eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Member.stub(:find_by_name) { mock_model(Member, update_attributes: false, errors: {}, build_all_character_jobs: [], available_rewards: []) }
        put :update, {:id => member.to_param, :member => {}, :reward_preferences => "" }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, {:id => member.to_param}
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, {:id => member.to_param}
      response.should redirect_to(members_url)
    end
  end

  describe "GET attendances" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :attendances, {:id => member.to_param}
      assigns(:member).should eq(member)
    end
  end

  describe "PUT update_active" do
    it "hides members that weren't selected" do
      member = FactoryGirl.create :member, active: true
      put :update_active, {member_ids: []}
      member.reload.active.should be_false
    end

    it "unhides members that were selected" do
      member = FactoryGirl.create :member, active: false
      put :update_active, {member_ids: [member.id]}
      member.reload.active.should be true
    end

    it "redirects to the members list" do
      put :update_active, {member_ids: []}
      response.should redirect_to(members_url)
    end
  end

  describe "PUT update_admins" do
    it "demotes members that weren't selected" do
      member = FactoryGirl.create :member, admin: true
      put :update_admins, {member_ids: []}
      member.reload.admin.should be_false
    end

    it "promotes members that were selected" do
      member = FactoryGirl.create :member, admin: false
      put :update_admins, {member_ids: [member.id]}
      member.reload.admin.should be(true)
    end

    it "redirects to the members list" do
      put :update_admins, {member_ids: []}
      response.should redirect_to(members_url)
    end
  end


  describe "PUT begin_new_cycle" do
    it "redirects to the member" do
      member = mock_model(Member)
      Member.stub(:find_by_name).and_return(member)
      member.stub :begin_new_cycle
      put :begin_new_cycle, {id: 1}
      response.should redirect_to(member)
    end

    it "should receive begin_new_cycle" do
      member = mock_model(Member)
      Member.stub(:find_by_name).and_return(member)
      member.should_receive(:begin_new_cycle)
      put :begin_new_cycle, {id: 1}
    end
  end
end
