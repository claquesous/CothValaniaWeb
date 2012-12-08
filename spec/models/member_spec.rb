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
      member.available_rewards.should eq(Reward.all)
    end

    it "should not include awards that have been received" do
      reward = FactoryGirl.create(:reward)
      member = Member.new
      member.character_rewards.build(:reward => reward, obtained: true)
      member.available_rewards.should_not include(reward)
    end

    it "should not include rewards that have been selected" do
      reward = FactoryGirl.create(:reward)
      member = Member.new
      member.character_rewards.build(reward: reward, obtained: false, preference: 1)
      member.available_rewards.should_not include(reward)
    end
  end

  describe "selected rewards" do
    it "should include rewards that have been selected" do
      reward = FactoryGirl.create(:reward)
      member = Member.new
      member.character_rewards.build(:reward => reward, obtained: true)
      member.selected_rewards.should_not include(reward)
    end

    it "should not include rewards that have been received" do
      reward = FactoryGirl.create(:reward)
      member = Member.new
      member.character_rewards.build(:reward => reward, obtained: true)
      member.selected_rewards.should_not include(reward)
    end

    it "should not include rewards that have not been selected" do
      reward = FactoryGirl.create(:reward)
      member = Member.new
      member.selected_rewards.should_not include(reward)
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
      reward = FactoryGirl.create(:reward)
      member = FactoryGirl.create(:member)
      member.character_rewards.create(reward: reward)
      member.save!
      member.build_rewards([])
      member.reload
      member.character_rewards.should eq([])
    end

    it "should not delete any existing obtained rewards" do
      member = FactoryGirl.create(:member)
      reward = FactoryGirl.create(:reward)
      cr = member.character_rewards.create(:preference => 2, reward: reward, obtained: true)
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
  end

  describe "member roles" do
    before :each do
      @member = FactoryGirl.create(:member)
      @admin = FactoryGirl.create(:member, admin: true)
      @leader = FactoryGirl.create(:member, leader: true)
    end
    describe "Member.leader" do
      it "should be the leader" do
        Member.leader.should eq(@leader)
      end
    end
    describe "Member.admins" do
      it "should include the leader" do
        Member.admins.should include(@leader)
      end
      it "should include any admin" do
        Member.admins.should include(@admin)
      end
      it "should not include a normal member" do
        Member.admins.should_not include(@member)
      end
    end
  end
end
