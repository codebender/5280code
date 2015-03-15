require 'spec_helper'

describe Fitbit::TimeSeries::Steps do
  subject { Fitbit::TimeSeries::Steps.new('1w') }

  describe '#resource_path' do
    it 'returns the fitbit resource path for tracker steps' do
      expect(subject.resource_path).to eql '/activities/tracker/steps'
    end
  end

  describe '#requested_resource' do
    it 'returns the fitbit resource name for tracker steps' do
      expect(subject.requested_resource).to eql 'activities-tracker-steps'
    end
  end
end
