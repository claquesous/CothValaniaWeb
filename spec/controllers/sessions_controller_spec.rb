require 'spec_helper'

describe SessionsController do
  def valid_attributes
    {
      member: @member.name,
      password: @member.password
    }
  end

  before :each do
    config_site
  end

  describe "GET new" do
    it "renders the new template" do
      get :new, {}
      response.should render_template("new")
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:members).and_return("")
        controller.instance_variable_set(:@site_config, config)
      end

      it "creates a new session" do
        @member = FactoryGirl.build(:member)
        Member.stub(:find_by_name).and_return(@member)
        @member.stub(:authenticate).and_return(true)
        post :create, {:session => valid_attributes}
        session[:member_id].should eq(@member.id)
      end

      it "redirects to the home page" do
        @member = FactoryGirl.build(:member)
        Member.stub(:find_by_name).and_return(@member)
        @member.stub(:authenticate).and_return(true)
        post :create, {:params => valid_attributes}
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid member" do
      it "assigns a flash message" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.stub(:find_by_name).and_return(nil)
        post :create, {:session => {}}
        flash[:warning].should eq("Invalid member or password")
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.stub(:find_by_name).and_return(nil)
        post :create, {:session => {}}
        response.should render_template("new")
      end
    end

    describe "with invalid password" do
      it "assigns a flash message" do
        # Trigger the behavior that occurs when invalid params are submitted
        member = mock_model("Member")
        Member.stub(:find_by_name).and_return(member)
        member.stub(:authenticate).and_return(false)
        post :create, {:session => {}}
        flash[:warning].should eq("Invalid member or password")
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        member = mock_model("Member")
        Member.stub(:find_by_name).and_return(member)
        member.stub(:authenticate).and_return(false)
        post :create, {:session => {}}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested session" do
      session[:member_id].should be_nil
      delete :destroy, {:id => session.to_param}
    end

    it "redirects to the login" do
      delete :destroy, {:id => session.to_param}
      response.should redirect_to(login_url)
    end
  end
end
