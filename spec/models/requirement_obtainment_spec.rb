require 'spec_helper'

describe RequirementObtainment do
  it { should belong_to(:requirement) }
  it { should belong_to(:event) }
end
