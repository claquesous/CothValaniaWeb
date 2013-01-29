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

  describe "total_points" do
    it "should default to 0" do
      Character.any_instance.stub(:valid?).and_return(true)
      character = Character.create
      character.total_points.should eq(0)
    end
  end

  ["add_occurrence", "destroy_occurrence"].each do |function|
    describe function do
      before :each do
        @occurrence = mock_model(Occurrence)
        @member = FactoryGirl.create(:member)
        @character = @member.characters.first
      end

      it "should call points on occurrence" do
        @member.stub(:current_occurrence?).and_return(true)
        @occurrence.should_receive(:points).and_return(3)
        @character.send function, @occurrence
      end

      it "should call current_occurrence? on member" do
        @occurrence.stub(:points).and_return(3)
        @member.should_receive(:current_occurrence?).with(@occurrence).and_return(true)
        @character.send function, @occurrence
      end

      it "should save character and member" do
        @occurrence.stub(:points).and_return(3)
        @member.stub(:current_occurrence?).and_return(true)
        @member.should_receive(:save!)
        @character.should_receive(:save!)
        @character.send function, @occurrence
      end

      it "should call points on occurrence" do
        @member.should_receive(:current_occurrence?).with(@occurrence).and_return(true)
        @member.should_receive(:save!)
        @character.should_receive(:save!)
        @occurrence.should_receive(:points).and_return(4)
        @character.send function, @occurrence
      end
    end
  end
end
