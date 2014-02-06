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
      device_info.last_sync_time.should eql Time.parse('2011-08-26T11:19:03.000')
      device_info.battery_level.should eql 'High'
      device_info.device_type.should eql 'Ultra'
    end
  end
end
