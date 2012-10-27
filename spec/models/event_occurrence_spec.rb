require 'spec_helper'

describe EventOccurrence do
  it { should belong_to(:event) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_rewards) }
  it { should have_many(:character_requirements) }
  it { should have_many(:character_requirements) }
end
