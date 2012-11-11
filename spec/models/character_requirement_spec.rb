require 'spec_helper'

describe CharacterRequirement do
  it { should belong_to(:character) }
  it { should belong_to(:used_occurrence) }
  it { should belong_to(:obtained_occurrence) }
end
