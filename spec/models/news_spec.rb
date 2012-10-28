require 'spec_helper'

describe News do
  it "can be instantiated" do
    News.new.should be_an_instance_of(News)
  end

  it "can be saved successfully" do
    News.create.should be_persisted
  end

  it { should belong_to(:member) }
end
