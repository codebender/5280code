module Fitbit
  class DeviceInfo
    include Fitbit::Client

    # https://wiki.fitbit.com/display/API/API-Get-Devices
    def get_data
      raw_data = client.devices
      parse_api_data(raw_data)
    end

    def parse_api_data(raw_data)
      parsed = raw_data.first.slice('battery', 'deviceVersion', 'lastSyncTime')
      Time.use_zone('Mountain Time (US & Canada)') do
        parsed['lastSyncTime'] = Time.zone.parse(parsed['lastSyncTime']).utc
      end
      parsed
    end
  end
end
