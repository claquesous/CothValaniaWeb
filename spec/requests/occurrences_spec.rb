require 'spec_helper'

describe "Occurrences" do
  before :each do
    login
    @event = FactoryGirl.create(:event)
    mock_model(Event,
      :id => 1,
    )
  end

  describe "GET /occurrences" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get event_occurrences_path(@event)
      response.status.should be(200)
    end
  end
end
