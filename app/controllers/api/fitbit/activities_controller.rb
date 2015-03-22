class Api::Fitbit::ActivitiesController < Api::BaseController

  def show
    if params[:time_frame].present?
      render json: time_series_activity_data
    else
      @activity_data = fitbit_activity_data
    end
  end

  private

  def time_series_activity_data
    Rails.cache.fetch(['fitbit_time_series_activity_data', params[:time_frame]],
      expires_in: 1.minute) do

      ::Fitbit::TimeSeries::Steps.new(params[:time_frame]).get_data
    end
  end

  def fitbit_activity_data
    Rails.cache.fetch('fitbit_activity_data', expires_in: 1.minute) do
      ::Fitbit::ActivityData.new.get_data
    end
  end
end
