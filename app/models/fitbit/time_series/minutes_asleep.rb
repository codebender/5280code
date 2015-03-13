module Fitbit::TimeSeries
  class MinutesAsleep < Base
    def resource_path
      '/sleep/minutesAsleep'
    end

    def requested_resource
      'sleep-minutesAsleep'
    end
  end
end
