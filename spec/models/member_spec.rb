require 'spec_helper'

describe Member do
  it "can be instantiated" do
    Member.new.should be_an_instance_of(Member)
  end

  it "can be saved successfully" do
    Member.create(name: :Cvweb, password: :cvwebpass).should be_persisted
  end

  it { should have_many(:characters) }
  it { should have_many(:character_rewards) }
  it { should have_many(:news) }
  it { should have_many(:shouts) }

  describe "available_rewards" do
    it "should return all rewards if nothing has been obtained or selected" do
      member = Member.new
      member.stub(:character_rewards).and_return([])
      member.should_receive(:available_rewards).and_return(Reward.all)
      member.available_rewards
    end

    it "should not return awards that have been received" do
      reward = FactoryGirl.create(:reward)
      member = FactoryGirl.create(:member)
      cr = member.character_rewards.build(:reward => reward)
      cr.occurrence_id = 2
      cr.save!
      member.available_rewards.should_not include(cr)
    end
  end

  describe "build_rewards" do
    it "should require an argument" do
      member = Member.new
      lambda { member.build_rewards }.should raise_error(ArgumentError)
    end

    it "should accept an array of reward_ids" do
      member = Member.new
      member.should_receive(:build_rewards)
      member.build_rewards([])
    end

    it "should delete any existing unobtained rewards" do
      member = FactoryGirl.create(:member)
      member.character_rewards.create
      member.build_rewards([])
      member.save!
      member.reload
      member.character_rewards.should eq([])
    end

    it "should not delete any existing obtained rewards" do
      member = FactoryGirl.create(:member)
      cr = member.character_rewards.build(:preference => 2)
      cr.occurrence_id = 2
      cr.save!
      member.build_rewards([])
      member.character_rewards.should eq([cr])
    end

    it "should create a new association for each item in the array" do
      member = FactoryGirl.create(:member)
      Reward.stub(:find).and_return(mock_model(Reward))
      member.build_rewards([2,3])
      member.save!
      member.character_rewards.count.should be(2)
    end

    it "should not overwrite an obtained reward" do
      rewards = [mock_model(CharacterReward, :preference => 2)]
      Reward.stub(:find).and_return(mock_model(Reward))
      member = FactoryGirl.create(:member)
#      member.character_rewards.should_receive(:build).twice
      member.build_rewards([2,3])
      member.save!
    end
  end
end
