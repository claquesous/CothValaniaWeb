require 'spec_helper'

describe SiteConfigsController do
  def valid_attributes
    { 
      site_name:  "Cvweb",
      password: "password",
      config_comment: "Nothing to see here!",
    }
  end

  def valid_member
    {
      name: "Cvweb",
      password: "password",
    }
  end

  before :each do
    controller.stub(:check_config_and_login).and_return(:true)
    controller.stub(:leader?).and_return(:true)
  end

  describe "GET index" do
    it "assigns all site_configs as @site_configs" do
      site_config = SiteConfig.create! valid_attributes
      get :index, {}
      assigns(:site_configs).should eq([site_config])
    end

    it "assigns new_leader_list with admins, but not current leader" do
      admin = FactoryGirl.create :member, admin: true
      leader = FactoryGirl.create :member, leader: true, admin: true
      get :index, {}
      assigns(:new_leader_list).should eq([admin])
    end
  end

  describe "GET show" do
    it "assigns the requested site_config as @site_config" do
      site_config = SiteConfig.create! valid_attributes
      get :show, {:id => site_config.to_param}
      assigns(:site_config).should eq(site_config)
    end
  end

  describe "GET new" do
    it "redirects if a SiteConfig already exists" do
      SiteConfig.create! valid_attributes
      get :new, {}
      response.should redirect_to(site_configs_path)
    end

    it "assigns a new site_config as @site_config" do
      get :new, {}
      assigns(:site_config).should be_a_new(SiteConfig)
    end
  end

  describe "GET edit" do
    it "assigns the requested site_config as @site_config" do
      site_config = SiteConfig.create! valid_attributes
      get :edit, {:id => site_config.to_param}
      assigns(:site_config).should eq(site_config)
    end
  end

  describe "POST create" do
    it "redirects if a SiteConfig already exists" do
      SiteConfig.create! valid_attributes
      post :create, {:site_config => valid_attributes, :member => valid_member}
      response.should redirect_to(site_configs_path)
    end

    describe "with valid params" do
      it "creates a new SiteConfig" do
        expect {
          post :create, {:site_config => valid_attributes, :member => valid_member}
        }.to change(SiteConfig, :count).by(1)
      end

      it "assigns a newly created site_config as @site_config" do
        post :create, {:site_config => valid_attributes, :member => valid_member}
        assigns(:site_config).should be_a(SiteConfig)
        assigns(:site_config).should be_persisted
      end

      it "redirects to the created site_config" do
        post :create, {:site_config => valid_attributes, :member => valid_member}
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site_config as @site_config" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteConfig.any_instance.stub(:save).and_return(false)
        post :create, {:site_config => { "site_name" => "invalid value" }, member: { name: "invalid"}}
        assigns(:site_config).should be_a_new(SiteConfig)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteConfig.any_instance.stub(:save).and_return(false)
        post :create, {:site_config => { "site_name" => "invalid value" }, member: { name: "invalid"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "authentication" do
      it "should call authenticate" do
        site_config = SiteConfig.create! valid_attributes
        SiteConfig.any_instance.should_receive(:authenticate)
        put :update, {:id => site_config.to_param, :site_config => { "site_name" => "MyString" }}
      end

      it "with invalid password re-renders the 'edit' template" do
        site_config = SiteConfig.create! valid_attributes
        # Trigger the behavior that occurs when invalid password is submitted
        SiteConfig.any_instance.stub(:authenticate).and_return(false)
        put :update, {:id => site_config.to_param, :site_config => { "site_name" => "invalid value" }}
        response.should render_template("edit")
      end
    end

    describe "with valid params" do
      before :each do
        SiteConfig.any_instance.stub(:authenticate).and_return(true)
      end

      it "creates a new site_config" do
        site_config = SiteConfig.create! valid_attributes
        expect {
          put :update, {:id => site_config.to_param, :site_config => valid_attributes, site: {password: "any"} }
        }.to change(SiteConfig, :count).by(1)
      end

      it "redirects to the site_configs index" do
        site_config = SiteConfig.create! valid_attributes
        put :update, {:id => site_config.to_param, :site_config => valid_attributes}
        response.should redirect_to(site_configs_path)
      end
    end

    describe "with invalid params" do
      before :each do
        SiteConfig.any_instance.stub(:authenticate).and_return(true)
      end

      it "assigns the site_config as @site_config" do
        site_config = SiteConfig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteConfig.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_config.to_param, :site_config => { "site_name" => "invalid value" }}
        assigns(:site_config).should eq(site_config)
      end

      it "re-renders the 'edit' template" do
        site_config = SiteConfig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteConfig.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_config.to_param, :site_config => { "site_name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site_config" do
      site_config = SiteConfig.create! valid_attributes
      expect {
        delete :destroy, {:id => site_config.to_param}
      }.to change(SiteConfig, :count).by(-1)
    end

    it "redirects to the site_configs list" do
      site_config = SiteConfig.create! valid_attributes
      delete :destroy, {:id => site_config.to_param}
      response.should redirect_to(site_configs_url)
    end
  end

  describe "PUT change_leader" do
    describe "with valid member" do
      before :each do
        @member = FactoryGirl.create :member, leader: nil
        @leader = FactoryGirl.create :member, leader: true
      end

      it "should add leader to selected member" do
        put :change_leader, { member_id: @member.id }
        @member.reload.leader.should be_true
      end

      it "should remove leader from old leader" do
        put :change_leader, { member_id: @member.id }
        @leader.reload.leader.should be_nil
      end

      it "should redirect to members index" do
        put :change_leader, { member_id: @member.id }
        response.should redirect_to(members_url)
      end
    end

    describe "with invalid member" do
      before :each do
        Member.should_receive(:find).and_return(nil)
      end

      it "should redirect to site_configs index" do
        put :change_leader, { }
        response.should redirect_to(site_configs_url)
      end
    end
  end
end
