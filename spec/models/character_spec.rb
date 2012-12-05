require 'spec_helper'

describe Character do
  it "can be instantiated" do
    Character.new.should be_an_instance_of(Character)
  end

  it { should belong_to(:member) }
  it { should have_many(:character_rewards) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_requirements) }
  it { should have_many(:character_jobs) }

  describe "sex" do
    before :each do
      @c = Character.new
    end

    it "need not be set" do
      @c.sex.should eq("")
      @c.read_attribute(:sex).should be_nil
    end

    it "can be set to male" do
      @c.sex = "Male"
      @c.sex.should eq("Male")
      @c.read_attribute(:sex).should eq(1)
    end

    it "can be set to female" do
      @c.sex = "Female"
      @c.sex.should eq("Female")
      @c.read_attribute(:sex).should eq(2)
    end
  end
end
