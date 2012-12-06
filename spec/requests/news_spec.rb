require 'spec_helper'

describe "News" do
  describe "GET /news" do
    it "does allow a normal user" do
      login
      get news_index_path
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get news_index_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get news_index_path
      response.status.should be(200)
    end
  end
  describe "GET /news/new" do
    it "does not allow a normal user" do
      login
      get new_news_path
      response.status.should be(302)
    end
    it "does allow an admin" do
      login :admin
      get new_news_path
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get new_news_path
      response.status.should be(200)
    end
  end
  describe "GET /news/show" do
    before :each do
      @news = FactoryGirl.create :news
    end
    it "does allow a normal user" do
      login
      get news_path @news
      response.status.should be(200)
    end
    it "does allow an admin" do
      login :admin
      get news_path @news
      response.status.should be(200)
    end
    it "does allow the leader" do
      login :leader
      get news_path @news
      response.status.should be(200)
    end
  end
  describe "GET /news/edit" do
    before :each do
      @news = FactoryGirl.create :news
    end
    it "does not allow a normal user" do
      login
      get edit_news_path @news
      response.status.should be(302)
    end
    it "does not allow an admin" do
      login :admin
      get edit_news_path @news
      response.status.should be(302)
    end
    it "does allow the leader" do
      login :leader
      get edit_news_path @news
      response.status.should be(200)
    end
  end
end

