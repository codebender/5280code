module Fitbit
  class Service
    class << self
      # https://wiki.fitbit.com/display/API/API-Get-User-Info
      def get_user_info
        Fitbit::UserInfo.new(client.user_info)
      end

      # https://wiki.fitbit.com/display/API/API-Get-Sleep
      def get_sleep_data
        Fitbit::SleepData.new(client.sleep_on_date(today))
      end

      # https://wiki.fitbit.com/display/API/API-Get-Devices
      def get_device_info
        Fitbit::DeviceInfo.new(client.devices)
      end

      # https://wiki.fitbit.com/display/API/API-Get-Activities
      def get_activity_data
        Fitbit::ActivityData.new(client.activities_on_date(today))
      end


      private

      def today
        Time.now.in_time_zone('Mountain Time (US & Canada)').to_date
      end

      def client
        @client ||= Fitgem::Client.new(
                      consumer_key: ENV["FITBIT_CONSUMER_KEY"],
                      consumer_secret: ENV["FITBIT_CONSUMER_SECRET"],
                      token: ENV["FITBIT_TOKEN"],
                      secret: ENV["FITBIT_SECRET"]
                  )
      end
    end
  end
end
