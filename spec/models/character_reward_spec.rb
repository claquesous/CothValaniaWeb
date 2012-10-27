require 'spec_helper'

describe CharacterReward do
  it { should belong_to(:character) }
  it { should belong_to(:reward) }
  it { should belong_to(:event_occurrence) }
end
