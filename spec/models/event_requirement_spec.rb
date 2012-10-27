require 'spec_helper'

describe EventRequirement do
  it { should belong_to(:event) }
  it { should belong_to(:character_requirement) }
end
