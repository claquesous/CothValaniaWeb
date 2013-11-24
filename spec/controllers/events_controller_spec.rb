require 'spec_helper'

describe EventsController, logged_in: true do
  let (:valid_attributes) { FactoryGirl.attributes_for :event }

  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, {}
      assigns(:events).should eq([event])
    end

    it "assigns only unhidden events normally" do
      event = FactoryGirl.create :event
      hidden = FactoryGirl.create :event, hidden: true
      get :index, {}
      assigns(:events).should eq([event])
    end

    it "assigns all events when passing update_visible" do
      event = FactoryGirl.create :event
      hidden = FactoryGirl.create :event, hidden: true
      get :index, {update_visible: true }
      assigns(:events).should eq([event, hidden])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:events).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}
        response.should redirect_to(Event.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.stub(:new) { mock_model(Event, save: false, errors: {}) }
        post :create, {:event => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do 
        config = mock_model(SiteConfig)
        config.stub(:events).and_return("")
        controller.instance_variable_set(:@config, config)
      end

      it "updates the requested event" do
        event = Event.create! valid_attributes
        # Assuming there are no other events in the database, this
        # specifies that the Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => event.to_param, :event => {'these' => 'params'}}
      end

      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}
        assigns(:event).should eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}
        response.should redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => {}}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.stub(:find_by_name) { mock_model(Event, update_attributes: false, errors: {}) }
        put :update, {:id => event.to_param, :event => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}
      response.should redirect_to(events_url)
    end
  end

  describe "PUT update_visible" do
    it "hides events that weren't selected" do
      event = FactoryGirl.create :event, hidden: false
      put :update_visible, {event_ids: []}
      event.reload.hidden.should be true
    end

    it "unhides events that were selected" do
      event = FactoryGirl.create :event, hidden: true
      put :update_visible, {event_ids: [event.id]}
      event.reload.hidden.should be false
    end

    it "redirects to the events list" do
      put :update_visible, {event_ids: []}
      response.should redirect_to(events_url)
    end
  end
end
