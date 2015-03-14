require 'spec_helper'

describe Fitbit::TimeSeries::Base do
  describe 'initialization' do
    it 'sets the period from the passed parameter' do
      instance = Fitbit::TimeSeries::Base.new('1w')
      expect(instance.period).to eql '1w'
    end

    it 'defaults base_date for time series data to today if it is no passed' do
      instance = Fitbit::TimeSeries::Base.new('1w')
      expect(instance.base_date).to eql 'today'
    end
  end

  describe '#get_data' do
    let(:instance) { Fitbit::TimeSeries::Base.new('1w') }

    it 'requests time series data with resource path & time arguments' do
      allow(instance).to receive(:resource_path).and_return('test/path')
      allow(instance).to receive(:requested_resource).and_return('test-path')

      expect_any_instance_of(Fitgem::Client).to receive(:data_by_time_range).
        with('test/path', period: '1w', base_date: 'today').
        and_return({'test-path' => []})

      instance.get_data
    end

    it 'parses the return data form the client' do
      allow(instance).to receive(:resource_path).and_return('test/path')
      allow_any_instance_of(Fitgem::Client).to receive(:data_by_time_range).
        and_return({'test-path' => []})

      expect(instance).to receive(:parse_api_data).with({'test-path' => []})

      instance.get_data
    end
  end

  describe "#parse_api_data" do
    let(:instance) { Fitbit::TimeSeries::Base.new('1w', 'today') }

    before(:each) do
      allow(instance).to receive(:requested_resource).and_return('fake-my-test')
    end

    it 'returns an empty hash if there is no data for the requested resource' do
      expect(instance.parse_api_data({test: 123})).to eql({})
    end

    it 'returns that raw api data' do
      raw_data = { 'fake-my-test' => [
        {"dateTime"=>"2015-02-09", "value"=>"37"},
        {"dateTime"=>"2015-02-10", "value"=>"44"},
        {"dateTime"=>"2015-02-11", "value"=>"66"}
      ]}

      expect(instance.parse_api_data(raw_data)).to eql(raw_data)
    end
  end

  describe "#resource_path" do
    it 'raises an error indicating that this method must be implmented' do
      expect { Fitbit::TimeSeries::Base.new('1w').resource_path }.to raise_error
    end
  end

  describe "#requested_resource" do
    it 'raises an error indicating that this method must be implmented' do
      expect { Fitbit::TimeSeries::Base.new('1w').requested_resource }.
        to raise_error
    end
  end
end
