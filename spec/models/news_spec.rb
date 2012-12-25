require 'spec_helper'

describe News do
  it "can be instantiated" do
    News.new.should be_an_instance_of(News)
  end

  it "can be saved successfully" do
    News.any_instance.stub(:valid?).and_return(true)
    News.create.should be_persisted
  end

  it { should belong_to(:member) }

  describe "save" do
    it "should save the date" do
      news = News.new
      news.stub(:valid?).and_return(true)
      time = Time.now
      Time.stub(:now).and_return(time)
      news.save!
      news.date.should eq(time)
    end
  end
end
