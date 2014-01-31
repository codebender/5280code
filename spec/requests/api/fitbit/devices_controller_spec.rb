require 'spec_helper'

describe 'Fitbit::DevicesController API' do
  describe 'GET /api/fitbit/device' do
    it 'returns the fitbit device info' do
      now = Time.zone.now
      device_info = double(Fitbit::DeviceInfo)
      allow(device_info).to receive(:last_sync_time).and_return(now)
      allow(device_info).to receive(:battery_level).and_return('High')
      allow(device_info).to receive(:device_type).and_return('Flex')
      allow(Fitbit::Service).to receive(:get_device_info).
        and_return(device_info)

      get '/api/fitbit/device'

      expect(response).to be_success
      expect(json['last_sync_time']).to eql now.iso8601(3)
      expect(json['battery_level']).to eql 'High'
      expect(json['device_type']).to eql 'Flex'
     end
  end
end
