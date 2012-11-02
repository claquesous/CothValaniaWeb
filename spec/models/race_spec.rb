require 'spec_helper'

describe Race do
  it "can be instantiated" do
    Race.new.should be_an_instance_of(Race)
  end

  it "can be saved successfully" do
    Race.create(name: :Race, remarks: "This race is awesome").should be_persisted
  end
end
