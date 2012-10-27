require 'spec_helper'

describe Member do
  it "can be instantiated" do
    Member.new.should be_an_instance_of(Member)
  end

  it "can be saved successfully" do
    Member.create(name: :Cvweb, password: :cvwebpass).should be_persisted
  end

  it { should have_many(:members) }
end
