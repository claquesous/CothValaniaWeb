require 'spec_helper'

describe EventOccurrence do
  it { should belong_to(:event) }
  it { should have_many(:event_attendances) }
  it { should have_many(:character_rewards) }
  it { should have_many(:requirements_obtainments) }
  it { should have_many(:event_requirements) }
end
