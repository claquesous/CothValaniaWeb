require 'spec_helper'

describe EventAttendance do
  it { should belong_to(:character) }
  it { should belong_to(:occurrence) }
  it { should belong_to(:character_job) }

  describe "on create" do
    before :each do
      EventAttendance.any_instance.stub(:valid?).and_return(true)
    end

    it "should receive set_points" do
      EventAttendance.any_instance.should_receive(:set_points)
      EventAttendance.create
    end

    it "should call add_occurrence for character" do
      ActiveModel::MassAssignmentSecurity::WhiteList.any_instance.stub(:deny?).and_return(false)
      character = mock_model(Character)
      occurrence = mock_model(Occurrence)
      character.should_receive(:add_occurrence).with(occurrence)
      EventAttendance.create(character: character, occurrence: occurrence)
    end
  end

  describe "on destroy" do
    before :each do
      EventAttendance.any_instance.stub(:valid?).and_return(true)
      EventAttendance.any_instance.stub(:set_points)
    end

    it "should receive reset_points" do
      event_attendance = EventAttendance.create
      event_attendance.should_receive(:reset_points)
      event_attendance.destroy
    end

    it "should call destroy_occurrence for character" do
      ActiveModel::MassAssignmentSecurity::WhiteList.any_instance.stub(:deny?).and_return(false)
      character = mock_model(Character)
      occurrence = mock_model(Occurrence)
      event_attendance = EventAttendance.create(occurrence: occurrence)
      event_attendance.stub(:character).and_return(character)
      character.should_receive(:destroy_occurrence).with(occurrence)
      event_attendance.destroy
    end
  end
end
