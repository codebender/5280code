require 'spec_helper'

describe Fitbit::DeviceInfo do
  let(:device_data) do
    [
      {
        "battery" => "High",
        "id" => "123456",
        "lastSyncTime" => "2011-08-26T11:19:03.000",
        "type" => "TRACKER",
        "deviceVersion" => "Ultra"
      }
    ]
  end

  describe 'get_data' do
    it 'calls the client to get the device data' do
      expect_any_instance_of(Fitgem::Client).to receive(:devices).and_return(
        device_data)

      Fitbit::DeviceInfo.new.get_data
    end

  end

  describe 'parse_api_data' do
    it 'parses the returns api hash args' do
      parsed_data = Fitbit::DeviceInfo.new.parse_api_data(device_data)
      Time.use_zone('Mountain Time (US & Canada)') do
        expect(parsed_data['lastSyncTime']).to eql Time.zone.
          parse('2011-08-26T11:19:03.000').utc
      end
      expect(parsed_data['battery']).to eql 'High'
      expect(parsed_data['deviceVersion']).to eql 'Ultra'
    end

    it 'only returns certain keys of the raw data' do
      parsed_data = Fitbit::DeviceInfo.new.parse_api_data(device_data)
      expect(parsed_data['id']).to be_nil
      expect(parsed_data['type']).to be_nil
    end
  end
end
