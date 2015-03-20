class Api::Fitbit::SleepsController < Api::BaseController

  def show
    if params[:time_frame].present?
      render json:
        ::Fitbit::TimeSeries::MinutesAsleep.new(params[:time_frame]).get_data
    else
      @sleep_data = ::Fitbit::SleepData.new.get_data
    end
  end
end
