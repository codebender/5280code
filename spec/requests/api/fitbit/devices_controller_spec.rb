require 'spec_helper'

describe 'Fitbit::DevicesController API' do
  describe 'GET /api/fitbit/device' do
    it 'returns the fitbit device info' do
      now = Time.zone.now
      allow_any_instance_of(Fitbit::DeviceInfo).to receive(:get_data).
        and_return({
          "battery" => "High",
          "lastSyncTime" => now,
          "deviceVersion" => "Flex"
        })


      get '/api/fitbit/device'

      expect(response).to be_success
      expect(json['last_sync_time']).to eql now.iso8601(3)
      expect(json['battery_level']).to eql 'High'
      expect(json['device_type']).to eql 'Flex'
     end
  end
end
