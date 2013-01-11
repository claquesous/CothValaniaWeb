require 'spec_helper'

describe "SiteConfigs" do
  describe "before first configuration" do
    describe "GET /site_configs" do
      it "does not allow anyone" do
        get site_configs_path
        response.status.should be(302)
      end
    end
    describe "GET /site_configs/new" do
      it "does allow anyone" do
        get new_site_config_path
        response.status.should be(200)
      end
    end
  end

  describe "after first configuration" do
    before :each do
      FactoryGirl.create :site_config
    end

    describe "GET /site_configs" do
      it "does not allow a normal user" do
        login
        get site_configs_path
        response.status.should be(302)
      end
      it "does not allow an admin" do
        login :admin
        get site_configs_path
        response.status.should be(302)
      end
      it "does allow the leader" do
        login :leader
        get site_configs_path
        response.status.should be(200)
      end
    end
    describe "GET /site_configs/new" do
      it "does not allow a normal user" do
        login
        get new_site_config_path
        response.status.should be(302)
      end
      it "does not allow an admin" do
        login :admin
        get new_site_config_path
        response.status.should be(302)
      end
      it "does not allow the leader" do
        login :leader
        get new_site_config_path
        response.status.should be(302)
      end
    end
    describe "GET /site_configs/show" do
      before :each do
        @site_config = FactoryGirl.create :site_config
      end
      it "does not allow a normal user" do
        login
        get site_config_path @site_config
        response.status.should be(302)
      end
      it "does not allow an admin" do
        login :admin
        get site_config_path @site_config
        response.status.should be(302)
      end
      it "does allow the leader" do
        login :leader
        get site_config_path @site_config
        response.status.should be(200)
      end
    end
    describe "GET /site_configs/edit" do
      before :each do
        @site_config = FactoryGirl.create :site_config
      end
      it "does not allow a normal user" do
        login
        get edit_site_config_path @site_config
        response.status.should be(302)
      end
      it "does not allow an admin" do
        login :admin
        get edit_site_config_path @site_config
        response.status.should be(302)
      end
      it "does allow the leader" do
        login :leader
        get edit_site_config_path @site_config
        response.status.should be(200)
      end
    end
  end
end
