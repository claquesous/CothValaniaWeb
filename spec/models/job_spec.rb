require 'spec_helper'

describe Job do
  it "can be instantiated" do
    Job.new.should be_an_instance_of(Job)
  end

  it { should have_many(:character_jobs) }
end
