class Api::Fitbit::ActivitiesController < Api::BaseController
  
  def show
    @activity_data = ::Fitbit::Service.get_activity_data
  end
end
