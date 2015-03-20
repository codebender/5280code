#https://wiki.fitbit.com/display/API/API-Get-Time-Series
module Fitbit::TimeSeries
  class Base
    include Fitbit::Client

    attr_reader :base_date, :period

    def initialize(period, base_date='today')
      @period = period
      @base_date = base_date
    end

    def get_data
      raw_data = client.data_by_time_range(resource_path, period: period,
        base_date: base_date)

      parse_api_data(raw_data)
    end

    def resource_path
      raise NotImplementedError, 'Must Implement #resource_path'
    end

    def parse_api_data(raw_data)
      return {} if raw_data[requested_resource].nil?

      raw_data
    end

    def requested_resource
      raise NotImplementedError, 'Must Implement #requested_resource'
    end
  end
end
