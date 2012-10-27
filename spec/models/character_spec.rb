require 'spec_helper'

describe Character do
  it "can be instantiated" do
    Character.new.should be_an_instance_of(Character)
  end

  it { should belong_to(:member) }
  it { should have_many(:shouts) }
  it { should have_many(:news) }
  it { should have_many(:character_rewards) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_requirements) }
end
