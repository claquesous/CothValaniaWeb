require 'spec_helper'

describe CharacterJob do
  it "can be instantiated" do
    CharacterJob.new.should be_an_instance_of(CharacterJob)
  end
  
  it { should belong_to(:character) }
  it { should belong_to(:job) }
end
