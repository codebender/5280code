class Api::Fitbit::SleepsController < Api::BaseController

  def show
    if params[:time_frame].present?
      render json: time_series_sleep_data

    else
      @sleep_data = fitbit_sleep_data
    end
  end

  private

  def time_series_sleep_data
    Rails.cache.fetch(['fitbit_time_series_sleep_data', params[:time_frame]],
      expires_in: 1.minute) do

        ::Fitbit::TimeSeries::MinutesAsleep.new(params[:time_frame]).get_data
    end
  end

  def fitbit_sleep_data
    Rails.cache.fetch('fitbit_sleep_data', expires_in: 1.minute) do
      ::Fitbit::SleepData.new.get_data
    end
  end
end
