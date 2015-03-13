require 'spec_helper'

describe Fitbit::TimeSeries::MinutesAsleep do
  subject { Fitbit::TimeSeries::MinutesAsleep.new('1w') }

  describe '#resource_path' do
    it 'returns the fitbit resource path for minutes asleep' do
      expect(subject.resource_path).to eql '/sleep/minutesAsleep'
    end
  end

  describe '#requested_resource' do
    it 'returns the fitbit resource name for minutes asleep' do
      expect(subject.requested_resource).to eql 'sleep-minutesAsleep'
    end
  end
end
