require 'spec_helper'

describe Occurrence do
  it { should belong_to(:event) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_rewards) }
  it { should have_many(:obtained_requirements) }
  it { should have_many(:used_requirements) }
end
