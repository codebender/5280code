module Fitbit::TimeSeries
  class Steps < Base
    def resource_path
      '/activities/tracker/steps'
    end

    def requested_resource
      'activities-tracker-steps'
    end
  end
end
