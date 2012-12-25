require 'spec_helper'

describe Shout do
  it { should belong_to(:member) }

  describe "save" do
    it "should save the date" do
      shout = Shout.new
      shout.stub(:valid?).and_return(true)
      time = Time.now
      Time.stub(:now).and_return(time)
      shout.save!
      shout.date.should eq(time)
    end
  end
end
