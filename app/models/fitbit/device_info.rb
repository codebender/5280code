module Fitbit
  class DeviceInfo
    attr_reader :last_sync_time,
                :battery_level,
                :device_type

    def initialize(args)
      Time.use_zone('Mountain Time (US & Canada)') do
        @last_sync_time = Time.zone.parse(args[0]['lastSyncTime']).utc
      end
      @battery_level = args[0]['battery']
      @device_type = args[0]['deviceVersion']
    end
  end
end
