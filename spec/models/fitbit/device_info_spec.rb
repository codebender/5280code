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

  describe 'initialize' do
    it 'parses the returns api hash args' do
      device_info = Fitbit::DeviceInfo.new(device_data)
      Time.use_zone('Mountain Time (US & Canada)') do
        expect(device_info.last_sync_time).to eql Time.zone.parse('2011-08-26T11:19:03.000')
      end
      expect(device_info.battery_level).to eql 'High'
      expect(device_info.device_type).to eql 'Ultra'
    end
  end
end
