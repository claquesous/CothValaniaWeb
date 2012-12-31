require 'spec_helper'

describe CharacterReward do
  it { should belong_to(:character) }
  it { should belong_to(:member) }
  it { should belong_to(:reward) }
  it { should belong_to(:occurrence) }

  describe "unobtained_or_occurrence" do
    before :each do
      ActiveModel::MassAssignmentSecurity::WhiteList.any_instance.stub(:deny?).and_return(false)
      CharacterReward.any_instance.stub(:valid?).and_return(true)
    end

    it "should return something received in the occurrence" do
      occurrence = mock_model(Occurrence)
      cr = CharacterReward.create!(occurrence: occurrence, obtained: true)
      CharacterReward.unobtained_or_occurrence(occurrence).should eq([cr])
    end

    it "should return something on a wishlist for someone who is active" do
      member = FactoryGirl.create(:member, active: true)
      cr = CharacterReward.create!(member: member)
      CharacterReward.unobtained_or_occurrence(mock_model(Occurrence)).should eq([cr])
    end

    it "should not return something on a wishlist for someone who is not active" do
      member = FactoryGirl.create(:member, active: false)
      cr = CharacterReward.create!(member: member)
      CharacterReward.unobtained_or_occurrence(mock_model(Occurrence)).should eq([])
    end

    it "should return both something obtained in occurrence and something listed on wishlist" do
      occurrence = mock_model(Occurrence)
      cr = CharacterReward.create!(occurrence: occurrence, obtained: true)
      member = FactoryGirl.create(:member, active: true)
      cr2 = CharacterReward.create!(member: member)
      CharacterReward.unobtained_or_occurrence(occurrence).should eq([cr2,cr])
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

    describe "set_obtained" do
      it "should set obtained to true if occurrence id is set" do
        @cr.save!
        @cr.occurrence = mock_model(Occurrence)
	expect {
	  @cr.save!
	}.to change(@cr, :obtained).from(false).to(true)
      end

      it "should set obtained to false if occurrence id not set" do
        @cr.occurrence = mock_model(Occurrence)
	@cr.save!
	@cr.occurrence = nil
	expect {
	  @cr.save!
	}.to change(@cr, :obtained).from(true).to(false)
      end
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
