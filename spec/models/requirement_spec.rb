require 'spec_helper'

describe Requirement do
  it "can be instantiated" do 
    Requirement.new.should be_an_instance_of(Requirement)
  end

  it { should have_many(:requirement_obtainments) }
  it { should have_many(:event_requirements) }
end
