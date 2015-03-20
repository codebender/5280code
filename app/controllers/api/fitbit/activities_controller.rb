class Api::Fitbit::ActivitiesController < Api::BaseController

  def show
    if params[:time_frame].present?
      render json: ::Fitbit::TimeSeries::Steps.new(params[:time_frame]).get_data
    else
      @activity_data = ::Fitbit::ActivityData.new.get_data
    end
  end
end
