require 'spec_helper'

describe EventReward do
  it { should belong_to(:event) }
  it { should belong_to(:reward) }
end
