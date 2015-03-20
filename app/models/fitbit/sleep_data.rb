module Fitbit
  class SleepData
    include Fitbit::Client

    # https://wiki.fitbit.com/display/API/API-Get-Sleep
    def get_data
      raw_data = client.sleep_on_date(today)
      parse_api_data(raw_data)
    end

    def parse_api_data(raw_data)
      return if raw_data['sleep'].empty?

      main_sleep = raw_data['sleep'].select{|s| s['isMainSleep'] }.first

      main_sleep.slice('minutesAsleep', 'timeInBed','minutesToFallAsleep',
        'efficiency')
    end
  end
end
