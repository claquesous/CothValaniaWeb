require 'spec_helper'

describe OccurrencesController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :occurrence }

  before :each do
    @event = FactoryGirl.create(:event)
    Event.stub(:find).and_return(@event)
  end

  describe "GET index" do
    it "assigns all occurrences as @occurrences" do
      occurrence = FactoryGirl.create(:occurrence, :event => @event)
      get :index, {:event_id => @event.to_param}
      assigns(:occurrences).should eq([occurrence])
    end
  end

  describe "GET show" do
    it "assigns the requested occurrence as @occurrence" do
      occurrence = FactoryGirl.create(:occurrence)
      get :show, {:event_id => @event.to_param, :id => occurrence.to_param}
      assigns(:occurrence).should eq(occurrence)
    end
  end

  describe "GET new" do
    it "assigns a new occurrence as @occurrence" do
      get :new, {:event_id => @event.to_param}
      assigns(:occurrence).should be_a_new(Occurrence)
    end
  end

  describe "GET edit" do
    it "assigns the requested occurrence as @occurrence" do
      occurrence = FactoryGirl.create(:occurrence)
      get :edit, {:event_id => @event.to_param, :id => occurrence.to_param}
      assigns(:occurrence).should eq(occurrence)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:occurrences).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Occurrence" do
        Occurrence.any_instance.should_receive(:save).and_return(true)
        Occurrence.any_instance.stub(:id).and_return(1)
        post :create, {:event_id => @event.to_param, :occurrence => valid_attributes}
      end

      it "assigns a newly created occurrence as @occurrence" do
        Occurrence.any_instance.should_receive(:save).and_return(true)
        Occurrence.any_instance.stub(:id).and_return(1)
        post :create, {:event_id => @event.to_param, :occurrence => valid_attributes}
        assigns(:occurrence).should be_a(Occurrence)
      end

      it "assigns the logged in user as the input member" do
        Occurrence.any_instance.should_receive(:save).and_return(true)
        Occurrence.any_instance.should_receive(:member=).with(@current_member)
        Occurrence.any_instance.stub(:id).and_return(1)
        post :create, {:event_id => @event.to_param, :occurrence => valid_attributes}
      end

      it "redirects to the created occurrence" do
        occurrence_id = 1
        Occurrence.any_instance.should_receive(:save).and_return(true)
        Occurrence.any_instance.stub(:id).and_return(occurrence_id)
        post :create, {:event_id => @event.to_param, :occurrence => valid_attributes}
        response.should redirect_to(event_occurrence_url(@event,occurrence_id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved occurrence as @occurrence" do
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        post :create, {:event_id => @event.to_param, :occurrence => {}}
        assigns(:occurrence).should be_a_new(Occurrence)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.stub(:new) { mock_model(Occurrence, save: false, errors: {}, :member= => true) }
        post :create, {:event_id => @event.to_param, :occurrence => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:occurrences).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested occurrence" do
        occurrence = FactoryGirl.create(:occurrence)
        # Assuming there are no other occurrences in the database, this
        # specifies that the Occurrence created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Occurrence.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:event_id => @event.to_param, :id => occurrence.to_param, :occurrence => {'these' => 'params'}}
      end

      it "assigns the requested occurrence as @occurrence" do
        occurrence = FactoryGirl.create(:occurrence)
        put :update, {:event_id => @event.to_param, :id => occurrence.to_param, :occurrence => valid_attributes}
        assigns(:occurrence).should eq(occurrence)
      end

      it "redirects to the occurrence" do
        occurrence = FactoryGirl.create(:occurrence)
        put :update, {:event_id => @event.to_param, :id => occurrence.to_param, :occurrence => valid_attributes}
        response.should redirect_to(event_occurrence_url(@event))
      end
    end

    describe "with invalid params" do
      it "assigns the occurrence as @occurrence" do
        occurrence = FactoryGirl.create(:occurrence)
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        put :update, {:event_id => @event.to_param, :id => occurrence.to_param, :occurrence => {}}
        assigns(:occurrence).should eq(occurrence)
      end

      it "re-renders the 'edit' template" do
        occurrence = FactoryGirl.create(:occurrence)
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.stub(:find) { occurrence }
        occurrence.stub(:update_attributes).and_return(false)
        put :update, {:event_id => @event.to_param, :id => occurrence.to_param, :occurrence => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested occurrence" do
      occurrence = FactoryGirl.create(:occurrence)
      expect {
        delete :destroy, {:event_id => @event.to_param, :id => occurrence.to_param}
      }.to change(Occurrence, :count).by(-1)
    end

    it "redirects to the occurrences list" do
      occurrence = FactoryGirl.create(:occurrence)
      delete :destroy, {:event_id => @event.to_param, :id => occurrence.to_param}
      response.should redirect_to(event_occurrences_url)
    end
  end

end
