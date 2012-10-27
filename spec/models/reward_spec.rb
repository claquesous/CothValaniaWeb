require 'spec_helper'

describe Reward do
  it "can be instantiated" do
    Reward.new.should be_an_instance_of(Reward)
  end

  it "can be saved successfully" do
    Reward.create(name: :reward).should be_persisted
  end

  it { should have_many(:event_rewards) }
  it { should have_many(:character_rewards) }
end
