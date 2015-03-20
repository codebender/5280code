module Fitbit
  class ActivityData
    include Fitbit::Client

    # https://wiki.fitbit.com/display/API/API-Get-Activities
    def get_data
      raw_data = client.activities_on_date(today)
      parse_api_data(raw_data)
    end

    def parse_api_data(raw_data)
      parsed_data = raw_data['summary'].slice('steps', 'caloriesOut',
        'activityCalories', 'veryActiveMinutes')
      parsed_data['distance'] = raw_data['summary']['distances'].
        select{|d| d['activity'] == 'tracker'}.first['distance']
      parsed_data
    end
  end
end
