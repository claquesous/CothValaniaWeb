require 'spec_helper'

describe EventAttendance do
  it { should belong_to(:character) }
  it { should belong_to(:event_occurrence) }
end
