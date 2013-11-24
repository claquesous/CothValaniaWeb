require 'spec_helper'

describe NewsController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :news }

  before :each do
    controller.stub(:current_member).and_return(mock_model("Member"))
  end

  describe "GET index" do
    it "assigns all news as @news" do
      news = FactoryGirl.create(:news)
      get :index, {}
      assigns(:news).should eq([news])
    end
  end

  describe "GET show" do
    it "assigns the requested news as @news" do
      news = FactoryGirl.create(:news)
      get :show, {:id => news.to_param}
      assigns(:news).should eq(news)
    end
  end

  describe "GET new" do
    it "assigns a new news as @news" do
      get :new, {}
      assigns(:news).should be_a_new(News)
    end
  end

  describe "GET edit" do
    it "assigns the requested news as @news" do
      news = FactoryGirl.create(:news)
      get :edit, {:id => news.to_param}
      assigns(:news).should eq(news)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new News" do
        expect {
          post :create, {:news => valid_attributes}
        }.to change(News, :count).by(1)
      end

      it "assigns a newly created news as @news" do
        post :create, {:news => valid_attributes}
        assigns(:news).should be_a(News)
        assigns(:news).should be_persisted
      end

      it "redirects to the created news" do
        post :create, {:news => valid_attributes}
        response.should redirect_to(News.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved news as @news" do
        # Trigger the behavior that occurs when invalid params are submitted
        News.any_instance.stub(:save).and_return(false)
        post :create, {:news => {}}
        assigns(:news).should be_a_new(News)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        News.stub(:new) { mock_model(News, save: false, errors: {}, :member= => true) }
        post :create, {:news => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested news" do
        news = FactoryGirl.create(:news)
        # Assuming there are no other news in the database, this
        # specifies that the News created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        News.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => news.to_param, :news => {'these' => 'params'}}
      end

      it "assigns the requested news as @news" do
        news = FactoryGirl.create(:news)
        put :update, {:id => news.to_param, :news => valid_attributes}
        assigns(:news).should eq(news)
      end

      it "redirects to the news" do
        news = FactoryGirl.create(:news)
        put :update, {:id => news.to_param, :news => valid_attributes}
        response.should redirect_to(news)
      end
    end

    describe "with invalid params" do
      it "assigns the news as @news" do
        news = FactoryGirl.create(:news)
        # Trigger the behavior that occurs when invalid params are submitted
        News.any_instance.stub(:save).and_return(false)
        put :update, {:id => news.to_param, :news => {}}
        assigns(:news).should eq(news)
      end

      it "re-renders the 'edit' template" do
        news = FactoryGirl.create(:news)
        # Trigger the behavior that occurs when invalid params are submitted
        News.stub(:find) { mock_model(News, update_attributes: false, errors: {}) }
        put :update, {:id => news.to_param, :news => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested news" do
      news = FactoryGirl.create(:news)
      expect {
        delete :destroy, {:id => news.to_param}
      }.to change(News, :count).by(-1)
    end

    it "redirects to the news list" do
      news = FactoryGirl.create(:news)
      delete :destroy, {:id => news.to_param}
      response.should redirect_to(news_index_url)
    end
  end

end
