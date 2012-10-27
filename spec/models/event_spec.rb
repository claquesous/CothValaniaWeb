require 'spec_helper'

describe Event do
  it { should have_many(:event_occurrences) }
  it { should have_many(:event_requirements) }
  it { should have_many(:event_rewards) }
  it { should have_many(:requirement_obtainments) }
end
