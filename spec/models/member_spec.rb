require 'spec_helper'

describe Member do
  it "can be instantiated" do
    Member.new.should be_an_instance_of(Member)
  end

  it "can be saved successfully" do
    Member.create(name: :Cvweb, password: :cvwebpass, characters_attributes: [name: :Cvweb]).should be_persisted
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
      member = FactoryGirl.create(:member)
      ActiveModel::MassAssignmentSecurity::WhiteList.any_instance.stub(:deny?).and_return(false)
      member.character_rewards.create(reward_id: reward.id, character_id: member.characters.first.id, occurrence: mock_model(Occurrence))
      member.available_rewards.should_not include(reward)
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

  describe "begin_new_cycle" do
    before :each do
      @time = Time.now
      Member.any_instance.stub(:get_last_reward_date).and_return(@time)
      @member = FactoryGirl.create :member
    end

    it "should increment reward_cycle" do
      expect {
        @member.begin_new_cycle
      }.to change(@member, :reward_cycle).by(1)
    end

    it "should set cycle_date" do
      expect {
        @member.begin_new_cycle
      }.to change(@member, :cycle_date).to @time
    end

    it "should save" do
      @member.should_receive :save!
      @member.begin_new_cycle
    end
  end
end
