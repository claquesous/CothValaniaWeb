require 'spec_helper'

describe Occurrence do
  it { should belong_to(:event) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_rewards) }
  it { should have_many(:obtained_requirements) }
  it { should have_many(:used_requirements) }

  describe "destroy" do
    before :each do
      @occurrence = FactoryGirl.create(:occurrence)
    end
    
    it "should receive unlink_rewards" do
      @occurrence.should_receive(:unlink_rewards)
      @occurrence.destroy
    end

    it "should receive unlink_requirements" do
      @occurrence.should_receive(:unlink_requirements)
      @occurrence.destroy
    end

    it "should delete attendance" do
      EventAttendance.any_instance.stub(:valid?).and_return(true)
      attendance = @occurrence.event_attendances.create!
      expect {
        @occurrence.destroy
      }.to change(EventAttendance, :count).by(-1)
    end

    it "should delete obtained_requirements" do
      CharacterRequirement.any_instance.stub(:valid?).and_return(true)
      @occurrence.obtained_requirements.create!
      expect {
        @occurrence.destroy
      }.to change(CharacterRequirement, :count).by(-1)
    end

    it "should disconnect used_requirements" do
      CharacterRequirement.any_instance.stub(:valid?).and_return(true)
      used_requirement = @occurrence.used_requirements.create
      expect {
        @occurrence.destroy
      }.to change(used_requirement, :used_occurrence_id).from(@occurrence.id).to(nil)
    end

    it "should disconnect character_rewards" do
      CharacterReward.any_instance.stub(:valid?).and_return(true)
      character_reward = @occurrence.character_rewards.create
      expect {
        @occurrence.destroy
      }.to change(character_reward, :occurrence_id).from(@occurrence.id).to(nil)
    end
  end
end
