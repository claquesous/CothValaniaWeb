require 'spec_helper'

describe CharacterReward do
  it { should belong_to(:character) }
  it { should belong_to(:member) }
  it { should belong_to(:reward) }
  it { should belong_to(:occurrence) }

  describe "unobtained_or_occurrence" do
    before :each do
      ActiveModel::MassAssignmentSecurity::WhiteList.any_instance.stub(:deny?).and_return(false)
      @occurrence = mock_model("Occurrence")
    end

    it "should return something received in the occurrence" do
      occurrence = FactoryGirl.create(:occurrence)
      cr = CharacterReward.create!(reward: mock_model("Reward"), member: mock_model("Member"), character: mock_model("Character"), occurrence: occurrence)
      CharacterReward.all.should eq([cr])
    end

    it "should return something on a wishlist for someone who is active" do
      member = FactoryGirl.create(:member, active: true)
      cr = CharacterReward.create!(reward: mock_model("Reward"), member: member, character: mock_model("Character"), occurrence: @occurrence)
      CharacterReward.active.should eq([cr])
    end

    it "should not return something on a wishlist for someone who is not active" do
      member = FactoryGirl.create(:member, active: false)
      cr = CharacterReward.create!(reward: mock_model("Reward"), member: member, character: mock_model("Character"), occurrence: @occurrence)
      CharacterReward.unobtained_or_occurrence(@occurrence).should eq([])
    end
  end

  describe "before_save" do
    before :each do
      @cr = CharacterReward.new
      @cr.stub(:valid?).and_return(true)
    end

    it "should receive set_obtained" do
      @cr.should_receive(:set_obtained)
      @cr.save!
    end

    it "should receive set_obtained_points" do
      @cr.should_receive(:set_obtained_points)
      @cr.save!
    end

    describe "set_obtained_points" do
      it "should receive preference" do
        @cr.should_receive(:preference)
        @cr.save!
      end

      it "should receive current_points" do
        @cr.stub(:preference).and_return(1)
        @cr.should_receive(:current_points)
        @cr.save!
      end

      it "should save the obtained points" do
        @cr.stub(:preference).and_return(1)
        @cr.stub(:current_points).and_return(30)
        @cr.save!
        @cr.obtained_points.should eq(30)
      end
    end
  end
end
